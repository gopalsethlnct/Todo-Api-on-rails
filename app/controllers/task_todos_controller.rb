class TaskTodosController < ApplicationController
    before_action :authorize_request
    # load_and_authorize_resource


    def index

        @task=TaskTodo.accessible_by(Ability.new(current_user)).page(params[:page] || 1).limit(5)
       render json: {
        "metadata": 
        {
            "page": @task.current_page,
            "per_page": @task.limit_value,
            "page_count": @task.total_pages,
            "total_count": @task.count,
            "links": [
              {"self": "/task_todos?page=#{@task.current_page}"},
              {"first": "/task_todos"},
              {"previous": "/task_todos?page=#{@task.current_page-1}"},
              {"next": "/task_todos?page=#{@task.next_page}"},
            ]
        },
        "data": {
            task: @task
        }
      } 
    

        # render json: @task, status: :ok
    end
    def show
        @task = TaskTodo.find(params[:id])
        render json: @task
    end
    def create
        @task = TaskTodo.new(task_params)
        @task.user_id = current_user.id

        if @task.save
          render json: @task, status: :created
        else
          render json: { errors: @task.errors.full_messages },
                 status: :unprocessable_entity
        end
    end

    def task_params
        params.permit(
           :task
        )
    end
end
