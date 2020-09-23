# frozen_string_literal: true

require 'date'

# CookBook class
class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = DateTime.now.strftime('%m-%d-%Y')
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

  def summary
    @recipes.map do |recipe|
      {
        name: recipe.name,
        details: {
          ingredients: recipe.ingredients_required.map do |ingredient, amount|
                         {
                           ingredient: ingredient.name,
                           amount: amount.to_s + ' ' + ingredient.unit
                         }
                       end,

          total_calories: recipe.total_calories
        }
      }
    end
  end
end
