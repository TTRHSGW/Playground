require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'validates test' do
    let(:user1){ FactoryBot.create(:user) }
    let(:user2){ FactoryBot.create(:user) }
    context 'followed_idがない時' do
      it '無効な状態であること' do
        relationship = FactoryBot.build(:relationship, follower_id: user1.id, followed_id: nil)
        expect(relationship).to_not be_valid
      end
    end
    context 'follower_idがない時' do
      it '無効な状態であること' do
        relationship = FactoryBot.build(:relationship, follower_id: nil, followed_id: user2.id )
        expect(relationship).to_not be_valid
      end
    end
    context 'followed_id, follower_idがある時' do
      it '有効な状態であること' do
        relationship = FactoryBot.build(:relationship, follower_id: user1.id, followed_id: user2.id )
        expect(relationship).to be_valid
      end
    end
  end
end
