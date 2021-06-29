class CreatePlanMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_meals do |t|
      t.references :meal_plan
      t.references :recipe
      t.string :meal_day
      t.string :meal_type

      t.timestamps
    end
  end
end
