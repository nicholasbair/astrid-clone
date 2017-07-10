class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = current_user.lists

    if current_user.phone_number.nil? || current_user.time_zone.nil?
      flash[:error] = "Add your phone number and time zone in 'My Account' to unlock SMS reminders."
    end
  end

  def show
    redirect_to user_lists_path(current_user) unless @list
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
