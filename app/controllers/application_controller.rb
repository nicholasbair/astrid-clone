class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    user_lists_path(current_user)
  end

  # Authorize user
  # Does the current_user match the user_id param?
  # Does the current_user 'own' the resource it is trying to access?
  def authorize_user
    # binding.pry
    user_not_authorized unless params_match_current_user?
  end

  private

    def params_match_current_user?
      current_user.id == params[:user_id].to_i
    end

    def user_not_authorized
      flash[:error] = 'Access denied.'
      redirect_to(request.referrer || root_path)
    end

end
