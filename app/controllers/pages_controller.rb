class PagesController < ApplicationController
  def home
    @users = User.all
  end

  def mypage
  end
end
