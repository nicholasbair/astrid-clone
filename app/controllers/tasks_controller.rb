class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_lists, only: [:new, :edit, :create]

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to user_list_path(current_user, @task.list)
    else
      set_error
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to user_list_path(current_user, @task.list)
    else
      set_error
      render :edit
    end
  end

  def destroy
    Task.destroy(@task)
    redirect_to user_list_path(current_user, @task.list)
  end

  private

    def set_error
      flash[:error] = @task.errors.full_messages[0]
    end

    def set_task
      @task = Task.find_by(:id => params[:id])
    end

    def set_lists
      @lists = List.available_lists.where(:user_id => current_user)
    end

    def task_params
      params.require(:task).permit(:status, :content, :list_id)
    end

end
