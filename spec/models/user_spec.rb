require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Factory Test' do
    it '有効なFactoryであること' do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end
  end

  describe 'method test' do
    let(:user1){ FactoryBot.create(:user) }
    let(:user2){ FactoryBot.create(:user) }
    it 'フォロー、アンフォローができること' do
      expect(user1.following?(user2)).to eq false
      user1.follow(user2)
      expect(user1.following?(user2)).to eq true
      user1.unfollow(user2)
      expect(user1.following?(user2)).to eq false
    end
  end
end
