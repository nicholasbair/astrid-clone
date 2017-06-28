class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit]

  def index
    @lists = List.where(:user_id => params[:user_id])
  end

  def show
  end

  def new
    @user = User.find_by(:id => params[:user_id])
    @list = @user.lists.build
  end

  def create
    # raise params.inspect
    @list = List.new(list_params)

    if @list.save
      redirect_to user_list_path(@list.user_id, @list)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

    def set_list
      @list = List.find_by(:id => params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :user_id, :tasks_attributes => [:content])
    end

end
