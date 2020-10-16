require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'Factory test' do
    context 'ユーザーが存在する時' do
      it 'Relationshipは登録できること' do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        relationship = FactoryBot.create(:relationship, follower_id: user1.id, followed_id: user2.id)
        expect(relationship).to be_valid
      end
    end
  end

end
