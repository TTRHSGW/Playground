class TweetsController < ApplicationController
  def new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    redirect_to '/pages/show'
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if current_user == tweet.user
      tweet.destroy
      redirect_to '/pages/show'
    else
      redirect_to '/pages/show'
    end
  end

    private

    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
end
