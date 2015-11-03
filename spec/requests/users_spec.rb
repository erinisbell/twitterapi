require 'request_helper'
require 'pry'

RSpec.describe "Users" do


  describe "#create" do
      it "creates user" do
        payload = {
          user: {
            username: "What",
            email: "faker@fake.com",
            password: "password"
          }
        }
        post users_path, payload
        expect(response).to have_http_status(:created)
      end

      it "requires email" do
        payload = {
          user: {
            username: "What",
            email: "",
            password: "dowhatnow"
          }
        }
        post users_path, payload
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json["email"]).to_not be_empty
      end
    end


    describe "#index" do
      it "shows multiple users" do
        payload = {
          user: {
            username: "What",
            email: "faker@fake.com",
            password: "password"
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
