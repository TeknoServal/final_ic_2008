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
end
