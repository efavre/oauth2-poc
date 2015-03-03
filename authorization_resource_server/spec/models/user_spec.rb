require "rails_helper"

RSpec.describe User do

  before(:each) do
    User.send(:public, *User.private_instance_methods)
  end
  
  context "#authenticate" do

    context "with correct credentials" do
      it "should succeed" do
        user = create(:user)
        expect(User.authenticate(user.login, user.password)).to eq(user)
      end
    end
  
    context "with incorrect credentials" do
      it "should fails" do
        user = create(:user)
        expect(User.authenticate(user.login, "wrong")).to eq(nil)
      end
    end
    
  end

end
