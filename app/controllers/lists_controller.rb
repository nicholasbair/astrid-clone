class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit]

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

    def set_list
      @list = List.find_by(:id => params[:id])
    end
end
