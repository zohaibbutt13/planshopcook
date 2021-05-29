class AddStatusToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :status, :string, default: 'pending'
  end
end
