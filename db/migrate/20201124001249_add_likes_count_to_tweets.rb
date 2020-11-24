class AddLikesCountToTweets < ActiveRecord::Migration[6.0]
  def self.up
    add_column :tweets, :likes_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :tweets, :likes_count
  end
end
