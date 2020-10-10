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
      get "/projects/new"
      expect(response.body).to include('Projects#new')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /users' do
    context 'titleが有効な時' do
      it 'Projectが登録されること' do
        expect do
          post projects_path, params: { project: { title: 'プロジェクト'} }
          expect(response).to have_http_status(302)
        end.to change(Project, :count).by(1)
      end
    end

    context 'titleが無効な時' do
      it 'Projectが登録されないこと' do
        expect do
          post projects_path, params: { project: { title: nil } }
          expect(response.body).to include("can&#39;t be blank")
        end.to change(Project, :count).by(0)
      end
    end
  end


end
