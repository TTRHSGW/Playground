class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :content, null: false
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
