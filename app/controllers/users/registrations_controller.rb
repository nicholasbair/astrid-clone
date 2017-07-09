class Users::RegistrationsController < Devise::RegistrationsController

  private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :phone_number, :time_zone)
    end

    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :phone_number, :time_zone, :current_password)
    end

end
