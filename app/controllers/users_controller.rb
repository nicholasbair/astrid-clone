class UsersController < ApplicationController
  def most_completed_tasks
    @most_completed = User.most_completed_tasks
  end
end
