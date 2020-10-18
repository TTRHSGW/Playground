class PagesController < ApplicationController
  def index
    if current_user
      @feeds = Tweet.where("user_id IN (?) OR user_id = ?", current_user.following.ids, current_user.id).order("created_at DESC")
    end
  end

  def show
    @tweet = Tweet.new
  end
end
