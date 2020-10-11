require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'Factory Test' do
    context 'contentが存在する時' do
      it 'Todoは有効な状態であること' do
        todo = FactoryBot.build(:todo)
        expect(todo).to be_valid
      end
    end

    context 'contentが存在しない時' do
      it 'Todoは無効な状態であること' do
        todo = FactoryBot.build(:todo, content: nil)
        expect(todo).to_not be_valid
        todo.valid?
        expect(todo.errors[:content]).to include("can't be blank")
      end
    end
  end
end
