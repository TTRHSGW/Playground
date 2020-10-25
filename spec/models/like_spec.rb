require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validates test' do
    let(:user){ FactoryBot.create(:user) }
    let(:tweet){ FactoryBot.create(:tweet) }
    context 'user_idがない時' do
      it '無効な状態であること' do
        like = FactoryBot.build(:like, user_id: nil, tweet_id: tweet.id)
        expect(like).to_not be_valid
      end
    end
    context 'tweet_idがない時' do
      it '無効な状態であること' do
        like = FactoryBot.build(:like, user_id: user.id, tweet_id: nil )
        expect(like).to_not be_valid
      end
    end
    context 'user_id, tweet_idがある時' do
      it '有効な状態であること' do
        like = FactoryBot.build(:like, user_id: user.id, tweet_id: tweet.id )
        expect(like).to be_valid
      end
    end
  end
end
