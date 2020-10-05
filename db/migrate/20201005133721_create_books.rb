class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.date :date_of_publication

      t.timestamps
    end
  end
end
