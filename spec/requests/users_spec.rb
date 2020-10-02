require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "index.htmlが読み込まれること" do
      get users_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('Users#index')
    end
  end

  describe "GET /users/new" do
    it "new.htmlが読み込まれること" do
      get new_user_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('Users#new')
    end
  end

  describe "POST /users" do
    it "Userが登録されること" do
      expect do
        post users_path, params: { user: { username: 'testman', password: 'password', password_confirmation: 'password' }}
      end.to change(User, :count).by(1)
      expect(response).to have_http_status(302)

    end
  end
end
