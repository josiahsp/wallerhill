class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    new_address_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin, :fname, :lname, :company)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :admin, :fname, :lname, :company)
  end
end