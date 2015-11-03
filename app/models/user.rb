class User < ActiveRecord::Base
 has_many :tweets #:follwers
 validates_presence_of :username, :email, :password
 acts_as_followable
 acts_as_follower

end
