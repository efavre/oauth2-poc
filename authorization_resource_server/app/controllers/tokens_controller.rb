class TokensController < ApplicationController

  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  def create
    client_id = params[:client_id]
    user = User.authenticate(params[:user][:login],params[:user][:password])
    client = Client.find_by_client_id(client_id)
    if user && client && json_request?
      @new_token = Token.create(user:user,client: client)
    else
      head status:401
    end
  end

protected

  def json_request?
    request.format.json?
  end

end
