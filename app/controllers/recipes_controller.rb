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
      format.html { created ? redirect_to(root_path) : render(:new) }
    end
  end

  private

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
      ingredients: [
        :ingredient_name
      ]
    )
  end
end
