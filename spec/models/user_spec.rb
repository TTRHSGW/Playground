require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Factory Test' do
    context 'nameとpasswordが有効な時' do
      it 'Userは有効な状態であること' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    context 'nameが4文字未満の時' do
      it 'Userは無効な状態であること' do
        user = FactoryBot.build(:user, name: '123')
        expect(user).to_not be_valid
      end
    end

    context 'nameがない時' do
      it 'Userは無効な状態であること' do
        user = FactoryBot.build(:user, name: nil)
        expect(user).to_not be_valid
      end
    end

    context 'nameが重複する時' do
      it 'Userは無効な状態であること' do
        FactoryBot.create(:user, name: 'test_name')
        user = FactoryBot.build(:user, name: 'test_name')
        expect(user).to_not be_valid
      end
    end

    context 'passwordがない時' do
      it 'Userは無効な状態であること' do
        user = FactoryBot.build(:user, password: nil)
        expect(user).to_not be_valid
      end
    end

    context 'passwordが6文字未満の時' do
      it 'Userは無効な状態であること' do
        user = FactoryBot.build(:user, password: 'pswd')
        expect(user).to_not be_valid
      end
    end

  end
end
