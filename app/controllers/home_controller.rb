class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :recipies]

  def index

    respond_to do |format|
      format.html
    end
  end

  def recipies
    breadcrumbs.add "Recipies", recipies_home_index_path, class: 'app-secondary-link'

    respond_to do |format|
      format.html
    end
  end
end
