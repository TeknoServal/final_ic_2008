require './test/test_helper'

class PantryTest < Minitest::Test
  def test_exists_with_attributes
    pantry = Pantry.new

    assert_instance_of Pantry, pantry

    expected = {}
    assert_equal expected, pantry.stock
  end
end
