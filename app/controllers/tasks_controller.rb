class TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: {
      success: true,
      message: 'Successfuly get data',
      data: @tasks
    }
  end

  # GET /tasks/1
  def show
    render json: {
      success: true,
      message: 'Successfuly find data',
      data: @task
    }
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if !@task.save
      render json: {
        success: false,
        message: 'Failed add task',
        warning: @task.errors
      }
    else
      render json: {
        success: true,
        message: 'Successfuly add task',
        data: @task
      }
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if !@task..update(task_params)
      render json: {
        success: false,
        message: 'Failed update task',
        warning: @task.errors
      }
    else
      render json: {
        success: true,
        message: 'Successfuly update task',
        data: @task
      }
    end
  end

  # DELETE /tasks/1
  def destroy
    if !@task.destroy
      render json: {
        success: false,
        message: 'Failed delete data',
        data: @tasks
      }
    else
      render json: {
        success: true,
        message: 'Successfuly delete data',
        data: @tasks
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      task = params.fetch(:task, {})

      task_params = {
        'name': task[:name],
        'description': task[:description],
        'due_date': task[:due_date],
        'priority': task[:priority],
        'is_completed': task[:is_completed],
        'created_by': task[:created_by],
      }
    end
end
