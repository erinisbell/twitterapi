require 'request_helper'

describe "#tokens" do
 it "logs in" do
   user = FactoryGirl.create(:user, password: "password")
   payload = {
     grant_type: "password",
     username: user.email,
     password: "password"
   }
   post oauth_token_path, payload
   expect(response).to have_http_status(:success)
   expect(json["access_token"]).to_not be_empty
 end


  it "fails if password is wrong" do
    user = FactoryGirl.create(:user, password: "password")
    payload = {
      grant_type: "password",
      username: user.email,
      password: "wrong"
    }
    post oauth_token_path, payload
    expect(response).to have_http_status(:unauthorized)
  end

  #create user, log them in, need two posts for this. you'd stub out the current user method to just resturn a specific person not a token
  #ecept current user to return something
  #put method get valid token that returns a token in request helper that has json method
end
