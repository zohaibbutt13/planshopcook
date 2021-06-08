# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end

    user ||= User.new

    if user.is_admin?
    else
      can [:new, :create, :index, :favorite_recipes, :add_to_favorite], Recipe
    end
  end
end
