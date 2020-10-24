require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  describe 'フォローした時' do
    it 'following.countが増えること' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      sign_in user1
      expect {
        post relationships_path, params: { followed_id: user2.id }, xhr: true
      }.to change(Relationship, :count).by(1)
    end
  end
end
