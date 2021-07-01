class MealPlansController < ApplicationController
  load_and_authorize_resource through: :current_user, only: [:new, :create]

  def new
    add_breadcrumbs "Recipies", recipes_path
    @week            = meal_params[:week].to_i <= 0 ? 1 : meal_params[:week].to_i
    meals_limit      = @week == 1 ? 7 : 14
    @breakfast_meals = Recipe.approved_recipes.where(meal_type: 'breakfast').order('RANDOM()').limit(meals_limit).includes(recipe_picture_attachment: :blob)
    @lunch_meals     = Recipe.approved_recipes.where(meal_type: 'lunch').order('RANDOM()').limit(meals_limit).includes(recipe_picture_attachment: :blob)
    @dinner_meals    = Recipe.approved_recipes.where(meal_type: 'dinner').order('RANDOM()').limit(meals_limit).includes(recipe_picture_attachment: :blob)

    respond_to do |format|
      format.html
    end
  end

  def get_all_meals
    @meals        = Recipe.approved_recipes.where(meal_type: meal_params[:meal_type]).limit(30).includes(recipe_picture_attachment: :blob)
    @meal_options = { meal_position: meal_params[:meal_position], meal_type: meal_params[:meal_type], meal_week: meal_params[:week] }

    respond_to do |format|
      format.js
    end
  end

  def select_meal
    @meal         = Recipe.approved_recipes.find_by(id: meal_params[:meal_id])
    @meal_options = { meal_position: meal_params[:meal_position], meal_type: meal_params[:meal_type], meal_week: meal_params[:week] }

    respond_to do |format|
      format.js
    end
  end

  private

  def meal_params
    params.permit(
      :meal_id,
      :meal_position,
      :meal_type,
      :week
    )
  end
end
