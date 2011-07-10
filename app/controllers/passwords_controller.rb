class PasswordsController < ApplicationController
  before_filter :authenticate_user!
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    
    res = @user.update_with_password(params[:user])
    logger.info "Password update result: #{res.inspect}"
    
    if res
      sign_in(@user, :bypass => true)
      redirect_to root_path, :notice => "password updated!"
    else
      render :edit
    end
  end
  
end
