class CreateMealPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_plans do |t|
      t.string :plan_type
      t.references :user

      t.timestamps
    end
  end
end
