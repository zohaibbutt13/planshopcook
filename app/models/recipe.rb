class Recipe < ApplicationRecord
  has_one_attached :recipe_picture, dependent: :destroy
  has_rich_text :cooking_instructions

  validates :recipe_picture, content_type: [:png, :jpg, :jpeg]

  belongs_to :created_by, class_name: 'User'

  has_many :ingredients, dependent: :destroy
  has_many :favorite_recipes

  accepts_nested_attributes_for :ingredients

  # attribute methods start
  def recipe_full_name
    recipe_name
  end

  def recipe_created_by

  end

  def recipe_category
    category
  end

  def recipe_meal_type
    meal_type
  end
  # attribute methods end
end
