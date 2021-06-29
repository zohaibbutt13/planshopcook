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
      type: 'POST',
      url: `/recipes/${recipeId}/add_to_favorite`
    }).done(function() {
      $(`#meal_item_menu_${recipeId} .unselected-icon-container`).toggleClass('collapse');
      $(`#meal_item_menu_${recipeId} .selected-icon-container`).toggleClass('collapse');
    });
  });

  $('body').on('click', '.js-remove-from-favorite-recipes-element', function(e) {
    e.preventDefault();
    var recipeId = $(this).data('recipeId');
    $.ajax({
      type: 'DELETE',
      url: `/recipes/${recipeId}/remove_from_favorite`
    }).done(function() {
      $(`#meal_item_menu_${recipeId} .unselected-icon-container`).toggleClass('collapse');
      $(`#meal_item_menu_${recipeId} .selected-icon-container`).toggleClass('collapse');
    });
  });

  $('body').on('click', '#add_new_ingredient', function(e) {
    e.preventDefault();
    var ingredientCount = parseInt($('#ingredient_count').val());
    $.ajax({
      type: 'GET',
      url: '/ingredients/new',
      data: { ingredient_count: ingredientCount }
    });
  });
});