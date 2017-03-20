class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
      can :manage, :all
    end

    can :manage, Favourite do |f|
      f.user == user
    end

    cannot :manage, Favourite do |f|
      f.user != user
    end

  end
end
