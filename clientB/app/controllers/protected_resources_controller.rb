class ProtectedResourcesController < ApplicationController

  def index
    if session[:access_token]
      rest_client_response = RestClient.get(Rails.configuration.x.resource_server.resources_url, accept:'json', 'Authorization' => "Bearer #{session[:access_token]}")
      if rest_client_response.code == 200
        resources_string = rest_client_response.to_s
        @resources_array = JSON.parse(resources_string)
      else
        session[:access_token] = nil
        redirect_to new_session_path
      end
    else
      redirect_to new_session_path
    end
  end

end
