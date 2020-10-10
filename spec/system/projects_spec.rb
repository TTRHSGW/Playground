require 'rails_helper'

RSpec.describe "Projects", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'create new project' do
    expect do
      visit new_project_path
      fill_in 'Title', with: 'プロジェクトX'
      click_button 'Create Project'
      expect(page).to have_content 'プロジェクトX'
    end.to change(Project, :count).by(1)
  end

  scenario 'update project' do
    project = FactoryBot.create(:project)
    visit edit_project_path(project)
    fill_in 'Title', with: 'Changed Title'
    click_button 'Update Project'
    expect(page).to have_content 'Changed Title'
  end
end
