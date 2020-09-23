require './test/test_helper'

class PantryTest < Minitest::Test
  def test_exists_with_attributes
    pantry = Pantry.new

    assert_instance_of Pantry, pantry

    expected = {}
    assert_equal expected, pantry.stock
  end

  def test_restock_stock_check
    pantry = Pantry.new

    ingredient1 = Ingredient.new({ name: 'Cheese', unit: 'oz', calories: 50 })
    ingredient2 = Ingredient.new({ name: 'Macaroni', unit: 'oz', calories: 200 })

    assert_equal 0, pantry.stock_check(ingredient1)

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)

    assert_equal 15, pantry.stock_check(ingredient1)
  end
end
