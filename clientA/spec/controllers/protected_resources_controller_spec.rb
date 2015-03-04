require 'rails_helper'

RSpec.describe ProtectedResourcesController, type: :controller do

  describe "GET #index" do

    context "with valid access token" do
      it "renders resources" do
        session[:access_token] = "VALID_TOKEN"
        
        RestClient = double
        rest_client_response = double
        allow(rest_client_response).to receive(:code) { 200 }
        allow(rest_client_response).to receive(:to_s) { "[{\"name\":\"Resource1\"}]" }
        allow(RestClient).to receive(:get) { rest_client_response }

        get :index
        
        expect(response).to have_http_status(200)
        expect(assigns[:resources_array]).to eq([{'name'=>'Resource1'}])
      end
    end

    context "with invalid access token" do
      it "redirects to new session path" do
        session[:access_token] = "INVALID_TOKEN"
        
        RestClient = double
        rest_client_response = double
        allow(rest_client_response).to receive(:code) { 401 }
        allow(RestClient).to receive(:get) { rest_client_response }

        get :index

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_session_path)
      end
    end

    context "without access tokens" do
      it "redirects to new session path" do

        get :index
        
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_session_path)
      end
    end

  end

end
