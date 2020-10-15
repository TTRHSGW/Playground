class PagesController < ApplicationController
  def index
  end

  def show
    @tweet = Tweet.new
  end
end
