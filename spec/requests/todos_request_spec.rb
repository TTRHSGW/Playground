require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe 'POST /todos' do
    context 'contentとprojectが存在する時' do
      it 'Todoが作成されること' do
        expect do
          project = FactoryBot.create(:project)
          post todos_path, params: { todo: { content: '牛乳を買う', done: false, project_id: project.id }}
          expect(response).to have_http_status(:redirect)
        end.to change(Todo, :count).by(1)
      end
    end
    context 'contentが存在しない時' do
      it 'Todoが作成されないこと' do
        expect do
          project = FactoryBot.create(:project)
          post todos_path, params: { todo: { content: nil, done: false, project_id: project.id }}
          expect(response).to have_http_status(:redirect)
        end.to change(Todo, :count).by(0)
      end
    end
  end

  describe 'PUT /todos/:id' do
    context 'contentとprojectが有効な時' do
      it 'Todoが更新されること' do
        todo = FactoryBot.create(:todo, content: 'コーヒーを買う')
        expect do
          put todo_path(todo), params: { todo: { content: '牛乳を買う', done: false, project_id: todo.project.id }}
          expect(response).to have_http_status(:redirect)
        end.to change{ Todo.find(todo.id).content }.from('コーヒーを買う').to('牛乳を買う')
      end
    end
    context 'contentが存在しない時' do
      it 'Todoが更新されないこと' do
        todo = FactoryBot.create(:todo, content: 'コーヒーを買う')
        expect do
          put todo_path(todo), params: { todo: { content: nil, done: false, project_id: todo.project.id }}
          expect(response).to have_http_status(:redirect)
        end.to_not change{ Todo.find(todo.id).content}
      end
    end
  end
end
