class UsersController < ApplicationController
  before_action :check_signed_in

  def following
    @following = current_user.following
  end

  def followers
    @followers = current_user.followers
  end
end
