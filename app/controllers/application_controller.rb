class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  private

  def add_breadcrumbs(text, breadcrumb_path, options = {})
    options[:class] = 'app-secondary-link breadcrumb-item' if options[:class].blank?
    breadcrumbs.add text, breadcrumb_path, options
  end
end
