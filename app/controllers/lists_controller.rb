class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update]

  def index
    @lists = current_user.lists
  end

  def show
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to user_list_path(current_user, @list)
    else
      set_error
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
      redirect_to user_list_path(current_user, @list)
    end
  end

  def delete
  end

  private

    def set_error
      flash[:error] = @list.errors.full_messages[0]
    end

    def set_list
      @list = List.find_by(:id => params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :tasks_attributes => [:content])
    end

end
