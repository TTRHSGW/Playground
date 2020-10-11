class ChangeDoneDefaultOnTodos < ActiveRecord::Migration[5.2]
  def change
    change_column_default :todos, :done, from: true, to: false
  end
end
