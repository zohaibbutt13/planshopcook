class Recipe < ApplicationRecord
  has_one_attached :recipe_picture, dependent: :destroy
  has_rich_text :cooking_instructions

  validates :recipe_picture, content_type: [:png, :jpg, :jpeg]

  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :ingredients
end
