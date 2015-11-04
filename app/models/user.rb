class User < ActiveRecord::Base
  has_many :tweets#, :follwers
  validates_presence_of  :email
  has_secure_password
  acts_as_followable
  acts_as_follower

  def generate_token
    self.auth_token = SecureRandom.hex(7)
    self.save!
    self.auth_token
  end
end
