require 'rails_helper'

RSpec.describe TokensController, :type => :controller do

  describe "POST #create" do
    context "with correct client_id and client_secret" do
      it "renders token as json" do
        user = create(:user)
        client = create(:client)
        post :create, client_id:client.client_id, user:{login:user.login,password:user.password}, format:"json"
        expect(response).to have_http_status(200)
        expect(assigns[:new_token]).to eq(user.tokens.last)
      end
    end

    context "with incorrect client" do
      it "renders 401" do
        user = create(:user)
        post :create, client_id:"not_client", user:{login:user.login,password:user.password}, format:"json"
        expect(response).to_not be_success
        expect(response).to have_http_status(401)
      end
    end

    context "with incorrect user" do
      it "renders 401" do
        user = create(:user)
        client = create(:client)
        post :create, client_id:client.client_id, user:{login:user.login,password:"wrong_password"}, format:"json"
        expect(response).to_not be_success
        expect(response).to have_http_status(401)
      end
    end

  end

end
