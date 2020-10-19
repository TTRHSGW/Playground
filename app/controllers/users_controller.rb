class UsersController < ApplicationController
  before_action :check_signed_in

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @following = current_user.following
  end

  def followers
    @followers = current_user.followers
  end
end
