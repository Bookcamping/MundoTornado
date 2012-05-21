class Ability
  include CanCan::Ability

  def initialize(user)
    can :show, Seed

    if user.blank?
      can :create, User
    elsif user.admin?
      can :manage, :all
    else
      cannot :create, User
    end
  end
end
