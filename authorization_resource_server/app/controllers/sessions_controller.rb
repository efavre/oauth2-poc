class SessionsController < ApplicationController

  def create
    if user = User.authenticate(params[:login], params[:password])
      render text:"OK", status:200
    else
      render text:"KO", status:401
    end
  end

end
