class RenameUsersIdColumnToTweets < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :users_id, :user_id
  end
end
