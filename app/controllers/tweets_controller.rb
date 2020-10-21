class TweetsController < ApplicationController

  def create
    tweet = Tweet.create(tweet_params)
    tweet.save
    redirect_to root_path
  end


  private
    def tweet_params
      params.require(:tweets).permit(:content, :user_id)
    end
end
