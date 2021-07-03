class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :recipies]

  def index
    @recipes = Recipe.approved_recipes.first(16)
    @favorite_recipe_ids = current_user.present? ? current_user.favorite_recipes.pluck(:recipe_id) : []

    respond_to do |format|
      format.html
    end
  end
end
