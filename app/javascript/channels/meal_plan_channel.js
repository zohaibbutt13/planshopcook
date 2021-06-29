$(document).on('turbolinks:load', function () {
  $('body').on('click', '.js-empty-box-element, .js-edit-meal-item', function() {
    var params = { meal_position: $(this).data('mealPosition'), meal_type: $(this).data('mealType'), week: $(this).data('mealWeek') };
    $.ajax({
      type: 'GET',
      url: '/meal_plans/get_all_meals',
      data: params
    });
  });

  $('body').on('click', '.js-select-meal-item', function() {
    var mealId       = $(this).data('mealId');
    var mealPosition = $(this).data('mealPosition');
    var mealType     = $(this).data('mealType');
    var mealWeek     = $(this).data('mealWeek');
    params = { meal_id: mealId, meal_position: mealPosition, meal_type: mealType, week: mealWeek };

    $.ajax({
      type: 'GET',
      url: `/meal_plans/${mealId}/select_meal`,
      data: params
    });
  });
});