class RegistrationsController < Devise::RegistrationsController


  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin, :fname, :lname, :company, :address1, :address2, :city, :state, :zip, :phone)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :admin, :fname, :lname, :company, :address1, :address2, :city, :state, :zip, :phone)
  end
end