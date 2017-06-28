class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit]

  def index
    @lists = List.where(:user_id => params[:user_id])
  end

  def show
  end

  def new
    user = User.find_by(:id => params[:user_id])
    @list = user.lists.build
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list
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
      params.require(:list).permit(:title)
    end

end
