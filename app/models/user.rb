class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :active_relationships, class_name:'Relationship', foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:'Relationship', foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :tweets
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet


  def following?(other_user)
    following.include?(other_user)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def liking?(tweet)
    like_tweets.include?(tweet)
  end

  def include_like(tweet)
    like_tweets << tweet
  end

  def remove_like(tweet)
    likes.find_by(tweet_id: tweet.id).destroy
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    Tweet.includes(:user, :likes).where("user_id IN (#{following_ids}) OR user_id = :user_id ", user_id: id).order("created_at DESC")
  end

  def my_tweets
    Tweet.includes(:user, :likes).where("user_id = :user_id ", user_id: id).order("created_at DESC")
  end

end
