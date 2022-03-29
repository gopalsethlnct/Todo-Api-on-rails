class CreateTaskTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :task_todos do |t|
      t.string :task

      t.timestamps
    end
  end
end
