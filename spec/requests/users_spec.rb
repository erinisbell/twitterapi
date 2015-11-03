require 'request_helper'
require 'pry'

RSpec.describe "Users" do


  describe "#create" do
      it "creates user" do
        payload = {
          user: {
            username: "What",
            email: "faker@fake.com"
          }
        }
        post users_path(payload)
        expect(response).to have_http_status(:success)
      end
    end

    describe "#index" do
      it "shows multiple users" do
        payload = {
          user: {
            username: "What",
            email: "faker@fake.com"
          }
        }
        get users_path(payload)
        expect(response).to have_http_status(:success)

      end
    end

    describe "#show" do
      it "shows a user " do
        payload = {
          user: {
            username: "What",
            email: "faker@fake.com"
          }
        }
        get users_path(payload)
        expect(response).to have_http_status(:success)
        expect(json[""].count).to eq 1
      end
    end
  end
