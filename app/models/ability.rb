class Ability
  include CanCan::Ability
  
  def initialize(user)
    can :read, :all
    #guest user
    user ||= User.new
    
    if user.role? :super_admin
      can :manage, :all
    else
      # restrict to specific actions in the contoller
      can [:home, :contact, :profile], :dashboard
    end
  end
end