class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body
  acts_as_followable
end
