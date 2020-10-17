class RelationshipsController < ApplicationController
  before_action :check_signed_in
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
  end
end
