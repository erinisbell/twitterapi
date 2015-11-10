require 'rails_helper'


RSpec.describe "Tweets" do
  let(:tweet) { FactoryGirl.create :tweet }
  let(:tweet2) { FactoryGirl.create :tweet }
  describe "#index" do
    it "show all tweets" do
      tweet
      tweet2
      get tweets_path(format: :json), tweet
      expect(response).to have_http_status(:success)
      expect(json["data"].count).to eq 2
    end
  end


  describe "#show" do
    it "shows a tweet" do
      get tweets_path(format: :json), tweet
      expect(response).to have_http_status(:success)
      expect(json["data"][0]["attributes"]["body"]).to eq tweet["body"]
    end
  end


  describe "#create" do
     let(:tweet)   { FactoryGirl.attributes_for(:tweet)}
     it "creates a tweet" do
       token = FactoryGirl.create(:access_token)
        # binding.pry
       post tweets_path(format: :json), {tweet: tweet}, { 'authorization' => "Bearer #{token.token}"}
       expect(response).to have_http_status(:created)
       expect(json["body"]).to eq tweet["body"]
     end
   end
end
