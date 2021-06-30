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

    if user.present?
      if user.is_admin?
        can [:home], :admin
      else
        can [:new, :create, :index, :show, :favorite_recipes, :add_to_favorite, :remove_from_favorite], Recipe
        can [:new], Ingredient
        can [:new, :create], MealPlan
      end
    end
  end
end
