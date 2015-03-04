require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "POST #create" do

    context "with valid user credentials" do
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

    context "with invalid user credentials" do
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

end
