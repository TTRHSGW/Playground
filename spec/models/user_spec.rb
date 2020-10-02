require 'rails_helper'

RSpec.describe User, type: :model do
  it '有効なモデルを持つこと' do
    user = User.new(
      username: 'test_user',
      password: 'password'
    )
    expect(user).to be_valid
  end

  it 'usernameが6文字未満だと無効な状態であること' do
    user = User.new(
      username: 'test',
      password: 'password'
    )
    user.valid?
    expect(user.errors[:username]).to include('is too short (minimum is 6 characters)')
  end

  it 'passwordが6文字未満だと無効な状態であること' do
    user = User.new(
      username: 'test_user',
      password: 'pass'
    )
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
  end
end
