class Recipe < ApplicationRecord
  has_one_attached :recipe_picture, dependent: :destroy
  has_rich_text :cooking_instructions

  validates :recipe_picture, presence: true, content_type: [:png, :jpg, :jpeg]
  validates :recipe_name, :username, :cook_time, :number_of_ingredients, presence: true
  validates :category, inclusion: { in: ['vegetarian', 'vegan', 'keto', 'pescatarian', 'mediterranean', 'kids', 'healthy'] }
  validates :meal_type, inclusion: { in: ['breakfast', 'lunch', 'dinner'] }

  belongs_to :created_by, class_name: 'User'

  has_many :ingredients, dependent: :destroy
  has_many :favorite_recipes

  accepts_nested_attributes_for :ingredients

  # attribute methods start
  def recipe_full_name
    recipe_name
  end

  def recipe_created_by
    created_by.user_full_name
  end

  def recipe_category
    category
  end

  def recipe_meal_type
    meal_type
  end

  def recipe_cook_time
    cook_time
  end

  def recipe_facebook_url
    "https://#{facebook_url}"
  end

  def recipe_youtube_url
    "https://#{youtube_url}"
  end

  def recipe_instagram_url
    "https://#{instagram_url}"
  end
  # attribute methods end
end
