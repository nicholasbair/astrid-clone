class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = current_user.lists
  end

  def show
  end

  def new
    @list = current_user.lists.build
  end

  def create
    binding.pry
    @list = List.new(list_params)
    @list.user = current_user

    if @list.save
      redirect_to user_list_path(current_user, @list)
    else
      set_error
      # TODO: issue #40
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to user_list_path(current_user, @list)
    else
      set_error
      render :edit
    end
  end

  def destroy
    @list.tasks.each { |t| Task.destroy(t) }
    List.destroy(@list)
    redirect_to user_lists_path(current_user)
  end

  private

    def set_error
      flash[:error] = @list.errors.full_messages[0]
    end

    def set_list
      @list = List.find_by(:id => params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :deadline_attributes => [:date], :tasks_attributes => [:content])
    end

end
