require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /following" do
    it "returns http success" do
      get "/users/following"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /followers" do
    it "returns http success" do
      get "/users/followers"
      expect(response).to have_http_status(:success)
    end
  end

end