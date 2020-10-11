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

  scenario 'プロジェクトが一覧表示されること' do
    project1 = FactoryBot.create(:project, title: 'プロジェクト1')
    project2 = FactoryBot.create(:project, title: 'プロジェクト2')
    project3 = FactoryBot.create(:project, title: 'プロジェクト3')
    visit projects_path
    expect(page).to have_content 'プロジェクト1'
    expect(page).to have_content 'プロジェクト2'
    expect(page).to have_content 'プロジェクト3'
    expect(page).to have_content '編集'
    expect(page).to have_content '削除'
  end

  scenario 'プロジェクトの詳細画面が表示され一覧画面に遷移できること' do
    project = FactoryBot.create(:project, title: 'Project Detail')
    visit project_path(project)
    expect(page).to have_content 'Project Detail'
    expect(page).to have_content '一覧'
    click_on '一覧'
    expect(page).to have_content 'Projects#index'
  end

  scenario 'プロジェクト一覧から詳細画面に遷移できること' do
    project = FactoryBot.create(:project, title: 'Index to Detail')
    visit projects_path
    click_on '開く'
    expect(page).to have_content 'Index to Detail'
  end
end
