class UsersController < ApplicationController
  before_action :set_user, only: %i[edit show update destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: '登録しました'
    else
      flash.now[:danger] = '登録できませんでした'
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: '更新しました'
    else
      flash.now[:danger] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: '削除しました'
    else
      render users
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
