module RecipesHelper
  def recipe_categories
    [
      ['Vegetarian', 'vegetarian'],
      ['Vegan', 'vegan'],
      ['Keto', 'keto'],
      ['Pescatarian', 'pescatarian'],
      ['Mediterranean', 'mediterranean'],
      ['Kids', 'kids'],
      ['Healthy', 'healthy']
    ]
  end

  def recipe_meal_types
    [
      ['Breakfast', 'breakfast'],
      ['Lunch', 'lunch'],
      ['Dinner', 'dinner']
    ]
  end
end
