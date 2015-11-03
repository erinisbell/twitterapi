class User < ActiveRecord::Base
 has_many :tweets#, :follwers
 validates_presence_of :username, :email
 has_secure_password
 acts_as_followable
 acts_as_follower

end
