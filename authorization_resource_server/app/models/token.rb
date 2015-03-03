class Token < ActiveRecord::Base

  belongs_to :user
  belongs_to :client

  validates :token, presence: true, uniqueness: true
  validates :user, presence: true
  validates :client, presence: true
  
  before_validation :generate_token

  EXPIRES_IN = 15.minutes

  def self.is_valid? access_token
    token = self.find_by_token(access_token)
    if token && token.created_at + EXPIRES_IN > Time.now 
      return true
    end
    return false 
  end

  def build_redirect_uri
    "#{self.client.redirect_uri}/access_token=#{ERB::Util.url_encode(self.token)}&expires_in=#{EXPIRES_IN}&token_type=bearer"
  end

protected

  def generate_token(bytes = 64)
    self.token = SecureRandom.base64(bytes)
  end

end
