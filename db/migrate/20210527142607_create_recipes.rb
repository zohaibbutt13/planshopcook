class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :username
      t.string :category
      t.string :meal_type
      t.datetime :cook_time
      t.integer :number_of_ingredients
      t.string :facebook_url
      t.string :instagram_url
      t.string :youtube_url
      t.string :website_url

      t.timestamps
    end
  end
end
