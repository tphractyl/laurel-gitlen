class Admin::SessionsController < ApplicationController
  layout 'admin'
  
  def new
  end
  
  def create
    if @user = login(params[:username],params[:password])
      redirect_to admin_exhibitions_path
    else
      flash.now[:alert] = "Login failed."; render :action => "new" 
    end
  end
end
