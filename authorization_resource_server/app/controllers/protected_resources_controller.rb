class ProtectedResourcesController < ApplicationController

  before_filter :check_access_token

  def index
    @resources = ProtectedResource.all
  end

  private

  def check_access_token
    head status:401 unless Token.is_valid?(bearer_token)
  end

  def bearer_token
    pattern = /^Bearer /
    header  = request.env["HTTP_AUTHORIZATION"]
    header.gsub(pattern, '') if header && header.match(pattern)
  end

end
