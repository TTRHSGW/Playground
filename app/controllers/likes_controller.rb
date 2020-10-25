class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    current_user.include_like(@tweet)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @tweet = Like.find(params[:id]).tweet
    current_user.remove_like(@tweet)
    respond_to do |format|
      format.js
    end
  end
end
