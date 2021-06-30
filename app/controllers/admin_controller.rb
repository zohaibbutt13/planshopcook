class AdminController < ApplicationController
  authorize_resource class: false

  def home
    @recipe_status = ['pending', 'approved', 'rejected'].include?(admin_recipe_params[:recipe_status]) ? admin_recipe_params[:recipe_status] : 'pending'
    @recipes       = Recipe.where(status: @recipe_status).includes(recipe_picture_attachment: :blob)

    respond_to do |format|
      format.html
    end
  end

  private

  def admin_recipe_params
    params.permit(:recipe_status)
  end
end
