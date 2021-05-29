class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :ingredient_name
      t.references :recipe
      t.references :user

      t.timestamps
    end
  end
end
