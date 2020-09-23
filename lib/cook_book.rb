# frozen_string_literal: true

# CookBook class
class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.map { |recipe| recipe.ingredients.map(&:name) }.flatten.uniq
  end

  def highest_calorie_meal
    @recipes.max_by(&:total_calories)
  end
end
