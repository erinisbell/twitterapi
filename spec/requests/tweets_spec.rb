require 'rails_helper'

RSpec.describe "Tweets" do

  describe "#index" do
    it "show all tweets" do
      FactoryGirl.create_list(:comment, 2, post: entry)
      FactoryGirl.create(:comment, post_id: 0)

      get post_comments_path(entry)
      expect(response).to have_http_status(:success)
      expect(json["data"].count).to eq 2
    end
  end
end
