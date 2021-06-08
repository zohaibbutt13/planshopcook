class CreateFavoriteRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_recipes do |t|
      t.references :user
      t.references :recipe

      t.timestamps
    end
  end
end
