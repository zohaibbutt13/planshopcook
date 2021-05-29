class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :recipies]

  def index

    respond_to do |format|
      format.html
    end
  end

  def recipies
    add_breadcrumbs "Recipies", recipies_home_index_path

    respond_to do |format|
      format.html
    end
  end
end
