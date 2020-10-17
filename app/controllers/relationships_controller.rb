class RelationshipsController < ApplicationController
  before_action :check_signed_in
  def create
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
  end
end
