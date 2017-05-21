class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :error

  def require_superuser!
    authenticate_user!

    unless current_user.superuser?
      flash[:error] = "You must be an admin to access this section"
      redirect_to root_path
    end
  end
end
