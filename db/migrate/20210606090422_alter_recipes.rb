class AlterRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :user_id, :created_by_id
  end
end
