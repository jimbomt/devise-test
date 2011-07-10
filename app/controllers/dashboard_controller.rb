class DashboardController < ApplicationController
  def home
  end

  def contact
  end
  
  def all_users
    @users = User.find(:all, :conditions => ["id IS NOT (?)", current_user.id])
  end

end
