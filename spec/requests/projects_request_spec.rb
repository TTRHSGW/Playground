require 'rails_helper'

RSpec.describe "Projects", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get projects_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      project = FactoryBot.create(:project)
      get projects_path(project)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_project_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /projects' do
    context 'titleが有効な時' do
      it 'Projectが登録されること' do
        expect do
          post projects_path, params: { project: { title: 'プロジェクト'} }
          expect(response).to have_http_status(:redirect)
        end.to change(Project, :count).by(1)
      end
    end

    context 'titleが無効な時' do
      it 'Projectが登録されないこと' do
        expect do
          post projects_path, params: { project: { title: nil } }
          expect(response).to have_http_status(:success)
        end.to change(Project, :count).by(0)
      end
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      project = FactoryBot.create(:project)
      get edit_project_path(project)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT /project/:id' do
    context 'titleが有効な時' do
      it 'Projectが更新されること' do
        project = FactoryBot.create(:project)
        put project_path(project), params: { project: { title: 'changed_project_title' } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'titleが無効な時' do
      it 'Projectが更新されないこと' do
        project = FactoryBot.create(:project, title: 'never_change_title')
        put project_path(project), params: { project: { title: nil } }
        expect(response).to have_http_status(:success)
        expect(project.title).to eq('never_change_title')
      end
    end
  end

  describe 'DELETE /project/:id' do
    it 'Projectが削除されること' do
      project = FactoryBot.create(:project, title: 'deleted_project')
      expect do
        delete project_path(project)
        expect(response).to have_http_status(:redirect)
      end.to change(Project, :count).by(-1)
    end
  end

end
