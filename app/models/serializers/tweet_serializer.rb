class TweetSerializer < ActiveModel::Serializer
  attributes :body, :user_id, :created_at, :updated_at
  belongs_to :user

end
