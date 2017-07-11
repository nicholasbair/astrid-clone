class Users::UsersController < ApplicationController
  before_filter :authenticate_user!

  def most_completed_tasks
    @most_completed = User.most_completed_tasks
    render 'users/most_completed_tasks'
  end
end
