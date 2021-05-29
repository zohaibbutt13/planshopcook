class MealPlansController < ApplicationController

  def new
    add_breadcrumbs "Recipies", recipies_home_index_path

    respond_to do |format|
      format.html
    end
  end
end
