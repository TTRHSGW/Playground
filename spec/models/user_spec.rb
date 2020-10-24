require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Factory Test' do
    it '有効なFactoryであること' do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end
  end

  describe 'follow unfollow test' do
    let(:user1){ FactoryBot.create(:user) }
    let(:user2){ FactoryBot.create(:user) }
    it 'フォロー、アンフォローができること' do
      expect(user1.following?(user2)).to eq false
      user1.follow(user2)
      expect(user1.following?(user2)).to eq true
      expect(user2.followers.include?(user1)).to eq true
      user1.unfollow(user2)
      expect(user1.following?(user2)).to eq false
    end
  end

  describe 'feed test' do
    let(:user1){ FactoryBot.create(:user) }
    let(:user2){ FactoryBot.create(:user) }
    let(:user3){ FactoryBot.create(:user) }
    let(:tweet1){ FactoryBot.create(:tweet, user: user1)}
    let(:tweet2){ FactoryBot.create(:tweet, user: user2)}
    let(:tweet3){ FactoryBot.create(:tweet, user: user3)}
    it '自身のTweetが含まれること' do
      expect(user1.feed).to include(tweet1)
    end

    it 'フォロー中ユーザーのTweetが含まれること' do
      user1.follow(user2)
      expect(user1.feed).to include(tweet2)
    end

    it 'フォローしていないユーザーのTweetが含まれないこと' do
      user1.follow(user2)
      expect(user1.feed).to_not include(tweet3)
    end

  end
end
