class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    respond_to do |format|
      format.js
    end
  end


  private
    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
end
