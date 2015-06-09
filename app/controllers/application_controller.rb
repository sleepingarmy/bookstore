class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_admin
  	@current_admin ||= Admin.where(id: session[:admin_id]) # nil or session id = admin id
  end

  private

  def authenticate_admin
  	unless session[:admin_id].present? && current_admin.present? #unless logged in OR current admin not nil
  		flash[:alert] = 'Intruder! Login to see content.'
  		redirect_to admin_login_path
	  end
 	end
end
