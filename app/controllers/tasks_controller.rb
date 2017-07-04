class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update]

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to user_list_path(current_user, @task.list)
  end

  def delete
  end

  private

    def set_task
      @task = Task.find_by(:id => params[:id])
    end

    def task_params
      params.require(:task).permit(:status)
    end

end
