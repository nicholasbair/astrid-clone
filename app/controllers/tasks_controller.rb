class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

    def set_task
      @task = Task.find_by(:id => params[:id])
    end

end
