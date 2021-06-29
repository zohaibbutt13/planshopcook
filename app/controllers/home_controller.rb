class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :recipies]

  def index
    @recipes = Recipe.first(16)
    @favorite_recipe_ids = current_user.present? ? current_user.favorite_recipes.pluck(:recipe_id) : []

    respond_to do |format|
      format.html
    end
  end

  def recipes
    add_breadcrumbs "Recipes", recipes_path

    where_hash             = {}
    where_hash[:category]  = recipe_params[:recipe_category] unless recipe_params[:recipe_category]   == ''
    where_hash[:meal_type] = recipe_params[:recipe_meal_type] unless recipe_params[:recipe_meal_type] == ''
    @recipes               = Recipe.where(where_hash).first(32)

    respond_to do |format|
      format.html
    end
  end

  private

  def recipe_params
    params.permit(:recipe_category, :recipe_meal_type)
  end
end
