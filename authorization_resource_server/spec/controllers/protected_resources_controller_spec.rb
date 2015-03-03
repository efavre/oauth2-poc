require 'rails_helper'

RSpec.describe ProtectedResourcesController, :type => :controller do


  describe "GET #index" do
    context "with valid access token" do
      it "renders resources" do
        token = create(:token)
        @request.env.merge!({'HTTP_AUTHORIZATION' => "Bearer #{token.token}"})
        get :index, format:"json"
        expect(response).to have_http_status(200)
      end
    end

    context "with invalid access token" do
      it "renders 401" do
        @request.env.merge!({'HTTP_AUTHORIZATION' => "Bearer INVALIDTOKEN"})
        get :index, format:"json"
        expect(response).to_not be_success
        expect(response).to have_http_status(401)
      end
    end

    context "without access tokens" do
      it "renders 401" do
        get :index, format:"json"
        expect(response).to_not be_success
        expect(response).to have_http_status(401)
      end
    end

  end

end
