class User < ActiveRecord::Base
  
  has_many :tokens

  validates :login, presence: true, uniqueness: true
  validates :password, presence: true

private

  def self.authenticate(login,password)
    return User.find_by(login:login,password:password)
  end

end
