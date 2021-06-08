class RecipesController < ApplicationController
  load_and_authorize_resource :recipe, through: :current_user

  def new

    respond_to do |format|
      format.html
    end
  end

  def create
    if @recipe.save
      flash[:notice] = 'Recipe added successfully'
      created = true
    else
      flash[:error] = @recipe.errors.full_messages
      created = false
    end
    respond_to do |format|
      format.html { created ? redirect_to(recipes_path) : render(:new) }
    end
  end

  def index
    add_breadcrumbs "Recipes", recipes_path

    where_hash             = {}
    where_hash[:category]  = recipe_index_params[:recipe_category] unless recipe_index_params[:recipe_category].blank?
    where_hash[:meal_type] = recipe_index_params[:recipe_meal_type] unless recipe_index_params[:recipe_meal_type].blank?
    @recipes               = Recipe.where(where_hash).limit(32).includes(recipe_picture_attachment: :blob)

    respond_to do |format|
      format.html
    end
  end

  def add_to_favorite
    @favorite_recipe = @current_user.favorite_recipes.build(recipe_id: @recipe.id)

    if @favorite_recipe.save
      flash.now[:notice] = "Recipe created successfully"
    else
      flash.now[:error]  = @favorite_recipe.errors.full_messages
    end

    respond_to do |format|
      format.js
    end
  end

  def favorite_recipes
    @favorite_recipes = current_user.favorite_recipes.includes(recipe: [recipe_picture_attachment: :blob])

    respond_to do |format|
      format.html
    end
  end

  private

  def recipe_index_params
    params.permit(:recipe_category, :recipe_meal_type)
  end

  def recipe_params
    params.require(:recipe).permit(
      :recipe_name,
      :username,
      :category,
      :meal_type,
      :cook_time,
      :number_of_ingredients,
      :cooking_instructions,
      :facebook_url,
      :youtube_url,
      :instagram_url,
      :website_url,
      :recipe_picture,
      ingredients: [
        :ingredient_name
      ]
    )
  end
end
