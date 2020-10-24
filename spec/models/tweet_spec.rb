require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'Factory Test' do
    let(:user){ FactoryBot.create(:user) }

    context 'contentがない時' do
      it '無効な状態であること' do
        tweet = FactoryBot.build(:tweet, content: nil, user_id: user.id )
        tweet.valid?
        expect(tweet).to_not be_valid
      end
    end

    context 'userがない時' do
      it '無効な状態であること' do
        tweet = FactoryBot.build(:tweet, content: 'Test', user_id: nil )
        tweet.valid?
        expect(tweet).to_not be_valid
      end
    end

    context 'contentとuserがある時' do
      it '有効な状態であること' do
        tweet = FactoryBot.build(:tweet, content: 'Test', user_id: user.id )
        tweet.valid?
        expect(tweet).to be_valid
      end
    end

  end
end
