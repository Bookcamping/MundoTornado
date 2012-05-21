class Ability
  include CanCan::Ability

  def initialize(user)
    can :show, Seed
    can :read, Page
    cannot :index, Page

    if user.blank?
      can :create, User
    elsif user.admin?
      can :manage, :all
    else
      # Regular user
      can :create, Seed
      can :manage, Seed, user_id: user.id
      cannot :create, User
      can :manage, Page
      can :update, User, id: user.id
    end
  end
end
