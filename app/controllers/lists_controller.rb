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
    @deadline = @list.build_deadline
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    if @list.save
      redirect_to user_list_path(current_user, @list)
    else
      set_error
      @deadline = @list.build_deadline
      
      # TODO: issue #40
      render :new
    end
  end

  def edit
    @deadline = @list.deadline

    if !@list.deadline
      @deadline = @list.build_deadline
    end
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
    List.destroy(@list.id)
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
      params.require(:list).permit(:title, :deadline_attributes => [:time, :time_zone], :tasks_attributes => [:content])
    end

end
