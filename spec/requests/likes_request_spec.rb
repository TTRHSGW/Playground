require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe 'include_like remove_likeテスト' do
    context 'include_likeした時' do
      it 'like_tweets.countが増えること' do
        user = FactoryBot.create(:user)
        tweet = FactoryBot.create(:tweet)
        sign_in user
        expect {
          post likes_path, params: { tweet_id: tweet.id }, xhr: true
        }.to change(user.like_tweets, :count).by(1)
      end
    end
    context 'remove_likeした時' do
      it 'like_tweets.countが減ること' do
        user = FactoryBot.create(:user)
        tweet = FactoryBot.create(:tweet)
        user.include_like(tweet)
        like = user.likes.find_by(tweet_id: tweet.id)
        sign_in user
        expect {
          delete like_path(like), xhr: true
        }.to change(user.like_tweets, :count).by(-1)
      end
    end
  end
end
