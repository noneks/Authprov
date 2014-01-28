class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here.
    # user ||= User.new # guest user (not logged in)
    # a signed-in user can do everything
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :editor
      can :read, :all
    end
  end
end