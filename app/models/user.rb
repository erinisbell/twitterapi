class User < ActiveRecord::Base
  has_many :tweets#, :follwers
  validates_presence_of  :email
  has_secure_password
  validates_uniqueness_of :email
  acts_as_followable
  acts_as_follower
  max_paginates_per 25

 def self.authenticate!(email, password)
   user = User.find_by_email(email)
   return false unless user
   user.authenticate(password)
 end

end
