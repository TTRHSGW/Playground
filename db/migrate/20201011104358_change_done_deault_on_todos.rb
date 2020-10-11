class ChangeDoneDeaultOnTodos < ActiveRecord::Migration[5.2]
  def change
    change_column_default :todos, :done, to: false
  end
end
