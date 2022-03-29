class SubTasksController < ApplicationController
    before_action :authorize_request

    def index
        @subtask = SubTask.all
        render json: @subtask, status: :ok
    end
    
    def create
        # binding.pry
        @subtask = SubTask.new(task_params)
        if @subtask.save
          render json: @subtask, status: :created
        else
          render json: { errors: @subtask.errors.full_messages },
                 status: :unprocessable_entity
        end
    end

    def task_params
      
        params.permit(
           :sub_task, :task_todo_id
        )
    end
end
