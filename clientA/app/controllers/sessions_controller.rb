class SessionsController < ApplicationController

  def create
    response = RestClient.post(Rails.configuration.x.authorization_server.token_url, :client_id => Rails.configuration.x.client.client_id, :user => {login: params[:login], password: params[:password]}, format:'json')
    if response.code == 200
      response_hash = JSON.parse(response)
      session[:access_token] = response_hash['oauth']['access_token']
      redirect_to protected_resources_path
    else
      session[:access_token] = nil
      redirect_to new_session_path      
    end
  end

end
