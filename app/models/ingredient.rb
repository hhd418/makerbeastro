class Ingredient < ActiveRecord::Base
  has_many :meal_ingredients, dependent: :destroy
  has_many :meals, through: :meal_ingredients
end
