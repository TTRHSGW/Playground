class PagesController < ApplicationController
  def home
    @users = User.all
  end

  def mypage
    @tweet = Tweet.new
  end
end
