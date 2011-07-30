class DashboardController < ApplicationController
  # activate access control with cancan at the controller level
  authorize_resource :class => false

  def home
  end

  def contact
  end
  
  def all_users
    @users = User.find(:all, :conditions => ["id IS NOT (?)", current_user.id])
    # authorize! :manage, User
  end
  
  def profile
    @user = current_user
  end

end
