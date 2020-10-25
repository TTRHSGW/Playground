require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  describe 'フォローアンフォローテスト' do
    context 'フォローした時' do
      it 'following.countが増えること' do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        sign_in user1
        expect {
          post relationships_path, params: { followed_id: user2.id }, xhr: true
        }.to change(user1.following, :count).by(1)
      end
    end
    context 'フォロー解除した時' do
      it 'following.countが減ること' do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        user1.follow(user2)
        relationship = user1.active_relationships.find_by(followed_id: user2.id)
        sign_in user1
        expect {
          delete relationship_path(relationship), xhr: true
        }.to change(user1.following, :count).by(-1)
      end
    end
  end
end
