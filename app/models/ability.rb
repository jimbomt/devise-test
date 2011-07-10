class Ability
  include CanCan::Ability
  
  def initialize(user)
    can :read, :all
    #guest user
    user ||= User.new
    
    if user.admin?
      can :manage, :all
    elsif
      cannot :access, :all_users
    end
  end
end