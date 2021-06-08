$(document).on('turbolinks:load', function () {
  $('body').on('click', '.js-category-option', function(e) {
    e.preventDefault();
    var category = $(this).data('categoryType');
    $('#recipe_category').val(category);
    $(this).addClass('selected');
    $('#recipes_home_form').submit();
  });

  $('body').on('click', '.js-meal-type-option', function(e) {
    e.preventDefault();
    var category = $(this).data('mealType');
    $('#recipe_meal_type').val(category);
    $(this).addClass('selected');
    $('#recipes_home_form').submit();
  });

  $('body').on('click', '.js-add-to-favorite-recipes-element', function(e) {
    e.preventDefault();
    var recipeId = $(this).data('recipeId');
    $.ajax({
      type: 'GET',
      url: `/recipes/${recipeId}/add_to_favorite`
    });
  })
});