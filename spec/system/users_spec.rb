require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "ユーザー新規作成" do
    context "フォームへ入力値が有効な時" do
      scenario '新しいユーザーが作られること' do
        expect do
          visit new_user_path
          expect(page).to have_content 'Users#new'

          fill_in 'Username', with: 'i_am_test_user'
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Create User'

          expect(page).to have_content 'i_am_test_user'
          expect(page).to have_content '登録しました'
        end.to change(User, :count).by(1)
      end
    end

    context 'フォームへの入力が無効な時' do
      scenario 'ユーザーは作られないこと' do
        expect do
          visit new_user_path
          expect(page).to have_content 'Users#new'
          fill_in 'Username', with: nil
          fill_in 'Password', with: nil
          fill_in 'Password', with: nil
          click_button 'Create User'

          expect(page).to have_content '登録できませんでした'
        end.to change(User, :count).by(0)
      end
    end
  end

  describe 'ユーザー更新' do
    context 'フォームへ入力値が有効な時' do
      scenario 'ユーザーが更新されること' do
        user = User.create(username: 'test_user', password: 'password')
        visit edit_user_path(user)
        expect(page).to have_content 'Users#edit'

        fill_in 'Username', with: 'change_name_user'
        fill_in 'Password', with: 'change_password'
        fill_in 'Password confirmation', with: 'change_password'
        click_button 'Update User'

        expect(page).to have_content '更新しました'
        expect(page).to have_content 'change_name_user'
      end
    end

    context 'フォームへの入力値が無効な時' do
      scenario 'ユーザーは更新されないこと' do
        user = User.create(username: 'test_user', password: 'password')
        visit edit_user_path(user)
        expect(page).to have_content 'Users#edit'

        fill_in 'Username', with: nil
        fill_in 'Password', with: nil
        fill_in 'Password confirmation', with: nil
        click_button 'Update User'

        expect(page).to have_content '更新できませんでした'
      end
    end
  end

  scenario 'destroy user' do
    User.create(username: 'deleted_user', password: 'password')
    visit users_path
    click_link '削除'
    expect(page).to_not have_content 'deleted_user'
  end
end
