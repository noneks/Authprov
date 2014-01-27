class Ability
  include CanCan::Ability

   def initialize(user)
    # a signed-in user can do everything
    if user.has_role? :admin
     # an admin can do everything
      can :manage, :all
    elsif user.has_role? :editor
      # an editor can do everything to documents and reports
      # but can only read, create and update charts (ie they cannot
      # be destroyed or have any other actions from the charts_controller.rb
      # executed)
      # an editor can only view the annual report
  end
end
