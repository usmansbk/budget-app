class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Deal, author: user
    can :manage, Category, user: user
  end
end
