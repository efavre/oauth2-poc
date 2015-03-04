class ProtectedResourcesController < ApplicationController

  def index
    if session[:access_token]
      begin
        rest_client_response = RestClient.get(Rails.configuration.x.resource_server.resources_url, accept:'json', 'Authorization' => "Bearer #{session[:access_token]}")
        resources_string = rest_client_response.to_s
        @resources_array = JSON.parse(resources_string)      
      rescue => e
        session[:access_token] = nil
        redirect_to new_session_path
      end
    else
      redirect_to new_session_path
    end
  end

end
