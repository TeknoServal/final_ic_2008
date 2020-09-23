require './test/test_helper'

class CookbookTest < Minitest::Test
  def test_exists_with_attributes
    cookbook = CookBook.new

    assert_instance_of CookBook, cookbook

    assert_equal [], cookbook.recipes
  end
end
