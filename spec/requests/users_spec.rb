require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'index.htmlが読み込まれること' do
      get users_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('Users#index')
    end
  end

  describe 'GET /users/new' do
    it 'new.htmlが読み込まれること' do
      get new_user_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('Users#new')
    end
  end

  describe 'POST /users' do
    context 'Userが有効な状態の時' do
      it 'Userが登録されること' do
        expect do
          post users_path, params: { user: { username: 'test_user', password: 'password', password_confirmation: 'password' } }
        end.to change(User, :count).by(1)
        expect(response).to have_http_status(302)
      end
    end

    context 'Userが無効な状態の時' do
      it 'Userが登録されないこと' do
        expect do
          post users_path, params: { user: { username: nil, password: 'password', password_confirmation: 'password' } }
        end.to change(User, :count).by(0)
        expect(response).to have_http_status(204)
      end
    end

  end

  describe 'GET /users/:id/edit' do
    it 'edit.htmlが読み込まれること' do
      user = User.create(username: 'first_test_man', password: 'password', password_confirmation: 'password')
      get edit_user_path(user)
      expect(response).to have_http_status(200)
      expect(response.body).to include('Users#edit')
    end
  end

  describe 'PUT /users/:id' do
    it 'Userが更新されること' do
      user = User.create(username: 'first_test_man', password: 'password', password_confirmation: 'password')
      put user_path(user), params: { user: { username: 'testman', password: 'password', password_confirmation: 'password' } }
      expect(response).to have_http_status(302)
    end
  end
end
