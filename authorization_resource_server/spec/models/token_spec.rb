require 'rails_helper'

RSpec.describe Token do

  before(:each) do
    Token.send(:public, *User.private_instance_methods)
  end

  context "#is_valid?" do
  
    context "with valid access token" do
      it "should return true" do
        token = create(:token)
        expect(Token.is_valid?(token.token)).to eq(true)
      end
    end

    context "with inexisting access token" do
      it "should return false" do
        expect(Token.is_valid?("NOTEXISTING")).to eq(false)
      end
    end

    context "with expired access token" do
      it "should return false" do
        token = create(:expired_token)
        expect(Token.is_valid?(token.token)).to eq(false)
      end
    end
  end

  context ".build_redirect_uri" do
  
    context "with access token" do
      it "should return url" do
        token = create(:token)
        expect(token.build_redirect_uri).to eq("http://redirect.uri//access_token=#{ERB::Util.url_encode(token.token)}&expires_in=900&token_type=bearer")
      end
    end
    
  end

end
