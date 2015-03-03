require "rails_helper"

RSpec.describe SessionsController, :type => :controller do
  
  describe "POST #create" do
    context "with correct credentials" do
      it "renders 200" do
        user = create(:user)
        post :create, login:user.login, password:user.password
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "with incorrect credentials" do
      it "renders 401" do
        user = create(:user)
        post :create, user:{login:user.login, password:"wrong_password"}
        expect(response).to_not be_success
        expect(response).to have_http_status(401)
      end
    end

  end

end