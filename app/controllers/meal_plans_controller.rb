class MealPlansController < ApplicationController

  def new
    add_breadcrumbs "Recipies", recipes_path

    respond_to do |format|
      format.html
    end
  end
end
