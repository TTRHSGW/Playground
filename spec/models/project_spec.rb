require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Factory Test' do
    context 'titleを持つ時' do
      it 'Projectは有効な状態であること' do
        project = FactoryBot.build(:project)
        expect(project).to be_valid
      end
    end
    context 'titleを持たない時' do
      it 'Projectは無効な状態であること' do
        project = FactoryBot.build(:project, title: nil)
        expect(project).to_not be_valid
        project.valid?
        expect(project.errors[:title]).to include("can't be blank")
      end
    end
    context 'titleが6文字未満の時' do
      it 'Projectは無効な状態であること' do
        project = FactoryBot.build(:project, title: 'short')
        expect(project).to_not be_valid
        project.valid?
        expect(project.errors[:title]).to include("is too short (minimum is 6 characters)")
      end
    end
    context 'titleが重複する時' do
      it 'Projectは無効な状態であること' do
        FactoryBot.create(:project, title: 'duplicate')
        project = FactoryBot.build(:project, title: 'duplicate')
        expect(project).to_not be_valid
        project.valid?
        expect(project.errors[:title]).to include("has already been taken")
      end
    end
  end
end
