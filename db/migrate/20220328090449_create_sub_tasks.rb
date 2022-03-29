class CreateSubTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_tasks do |t|
      t.string :sub_task

      t.timestamps
    end
  end
end
