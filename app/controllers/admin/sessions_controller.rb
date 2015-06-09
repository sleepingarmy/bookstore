class Admin::SessionsController < ApplicationController

  def new
 
  end

  def create
    @admin = Admin.where(username: params[:username]).first
    if @admin.present? && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      flash[:notice] = 'Welcome!'
      redirect_to admin_path
    else
      flash[:alert] = 'Oops, you entered the wrong username or password. wah wah.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_login_path
  end
end