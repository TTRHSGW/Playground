class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :content
      t.boolean :done
      t.references :project, nil: false, foreign_key: true

      t.timestamps
    end
  end
end
