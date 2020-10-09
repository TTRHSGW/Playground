# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Factory Test' do
    context 'nameとpasswordがある時' do
      it 'ユーザーは有効な状態であること' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    context 'nameがない時' do
      it 'ユーザーは無効な状態であること' do
        user = FactoryBot.build(:user, name: nil)
        expect(user).to_not be_valid
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end
    end

    context 'passwordがない時' do
      it 'ユーザーは無効な状態であること' do
        user = FactoryBot.build(:user, password: nil)
        expect(user).to_not be_valid
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
    end
  end

  describe 'palindrome test' do
    it 'nameの回文が返されること' do
      user = FactoryBot.build(:user, name: 'test_user')
      expect(user.palindrome).to eq('resu_tset')
    end
  end
end
