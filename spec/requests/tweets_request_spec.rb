require 'rails_helper'

RSpec.describe "Tweets", type: :request do

  describe 'create tweet' do
    let(:user1){FactoryBot.create(:user)}
    let(:user2){FactoryBot.create(:user)}
    it 'Tweetが登録されること' do
      expect {
      post tweets_path, params: { tweet: { content: 'First Tweet', user_id: user1.id } }
      }.to change(Tweet, :count).by(1)
    end
  end
end
