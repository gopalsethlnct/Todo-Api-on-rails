class TaskTodo < ApplicationRecord
    has_many :sub_tasks
    has_many :user
end
