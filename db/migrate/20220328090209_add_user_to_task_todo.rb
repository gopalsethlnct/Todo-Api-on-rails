class AddUserToTaskTodo < ActiveRecord::Migration[6.1]
  def change
    add_reference :task_todos, :user, null: false, foreign_key: true
  end
end
