require './test/test_helper'

class CookbookTest < Minitest::Test
  def test_exists_with_attributes
    cookbook = CookBook.new

    assert_instance_of CookBook, cookbook

    assert_equal [], cookbook.recipes
  end

  def test_add_recipe
    cookbook = CookBook.new

    recipe1 = Recipe.new('Mac and Cheese')
    recipe2 = Recipe.new('Cheese Burger')

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    assert_equal [recipe1, recipe2], cookbook.recipes
  end

  def test_ingredients
    cookbook = CookBook.new

    ingredient1 = Ingredient.new({ name: 'Cheese', unit: 'oz', calories: 100 })
    ingredient2 = Ingredient.new({ name: 'Macaroni', unit: 'oz', calories: 30 })
    ingredient3 = Ingredient.new({ name: 'Ground Beef', unit: 'oz', calories: 100 })
    ingredient4 = Ingredient.new({ name: 'Bun', unit: 'g', calories: 75 })

    recipe1 = Recipe.new('Mac and Cheese')
    recipe2 = Recipe.new('Cheese Burger')

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    assert_equal ['Cheese', 'Macaroni', 'Ground Beef', 'Bun'], cookbook.ingredients
  end

  def test_highest_calorie_meal
    cookbook = CookBook.new

    ingredient1 = Ingredient.new({ name: 'Cheese', unit: 'oz', calories: 100 })
    ingredient2 = Ingredient.new({ name: 'Macaroni', unit: 'oz', calories: 30 })
    ingredient3 = Ingredient.new({ name: 'Ground Beef', unit: 'oz', calories: 100 })
    ingredient4 = Ingredient.new({ name: 'Bun', unit: 'g', calories: 75 })

    recipe1 = Recipe.new('Mac and Cheese')
    recipe2 = Recipe.new('Cheese Burger')

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    assert_equal recipe2, cookbook.highest_calorie_meal
  end

  def test_date
    cookbook = CookBook.new

    assert_equal '09-23-2020', cookbook.date
  end
end
