require 'rails_helper'

RSpec.describe "Tweets" do

  describe "#index" do
    let(:tweet) { FactoryGirl.create :tweet }
    it "show all tweets" do
      get tweets_path, tweet
      expect(response).to have_http_status(:success)
      expect(json.count).to eq 1
    end
  end


  describe "#show" do
    let(:tweet) { FactoryGirl.create :tweet }
    it "shows a tweet" do
      get tweets_path, tweet
      expect(response).to have_http_status(:success)
      expect(json[0]["body"]).to eq tweet["body"]
    end
  end

end


# RSpec.describe "Tweets" do
#   let(:payload) {{
#     "user": {
#       "email": "Joe@ensminger",
#       "password": "password"
#     }
#   }}
#   let(:login) {{
#     "grant_type": "password",
#     "username": "user100@example.com",
#     "password": "password"
#   }}
#   let(:tweet) {{
#     "body": "This is in my test suite"
#   }}
#   describe "#index" do
#     it "lists all tweets on page" do
#       User.create(payload)
#       post oauth_token_path, login
#       expect(response).to have_http_status(:success)
#       expect(json["access_token"]).to_not be_empty
#       post tweets_path, tweet
#       expect(response).to have_http_status(:created)
#     end
#   end
# end
