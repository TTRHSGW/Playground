require 'rails_helper'

RSpec.describe User, type: :model do
  it 'フォローができること' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    expect(user1.following?(user2)).to eq false
    expect(user2.followers.include?(user1)).to eq false
    user1.follow(user2)
    expect(user1.following?(user2)).to eq true
    expect(user2.followers.include?(user1)).to eq true
  end

  it 'アンフォローができること' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    user1.follow(user2)
    expect(user1.following?(user2)).to eq true
    expect(user2.followers.include?(user1)).to eq true
    user1.unfollow(user2)
    expect(user1.following?(user2)).to eq false
    expect(user2.followers.include?(user1)).to eq false
  end

end
