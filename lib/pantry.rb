# frozen_string_literal: true

# Pantry class
class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end
end
