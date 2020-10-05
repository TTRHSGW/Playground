require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    it "index.htmlが読み込まれること" do
      get books_path
      expect(response).to have_http_status(200)
    end
  end
end
