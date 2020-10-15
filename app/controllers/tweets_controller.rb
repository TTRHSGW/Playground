class TweetsController < ApplicationController
  def new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    redirect_to @tweet.user
  end

    private

    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
end
