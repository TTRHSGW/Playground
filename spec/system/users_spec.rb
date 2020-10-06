require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "create a new user" do
    expect do
      visit new_user_path
      expect(page).to have_content "Users#new"

      fill_in "Username", with: "i_am_test_user"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Create User"

      expect(page).to have_content "i_am_test_user"
    end.to change(User, :count).by(1)
  end

  scenario "update user" do
    user = User.create(username: "test_user", password: "password")
    visit edit_user_path(user)
    expect(page).to have_content "Users#edit"

    fill_in "Username", with: "change_name_user"
    fill_in "Password", with: "change_password"
    fill_in "Password confirmation", with: "change_password"
    click_button "Update User"

    expect(page).to have_content "change_name_user"
  end

  scenario "destroy user" do
    user = User.create(username: "deleted_user", password: "password")
    visit users_path
    click_link "削除"
    expect(page).to_not have_content "deleted_user"
  end
end
