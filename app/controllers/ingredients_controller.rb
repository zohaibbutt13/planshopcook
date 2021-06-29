class IngredientsController < ApplicationController
  load_and_authorize_resource

  def new
    @ingredient_count = params.permit(:ingredient_count)[:ingredient_count].to_i + 1

    respond_to do |format|
      format.js
    end
  end
end
