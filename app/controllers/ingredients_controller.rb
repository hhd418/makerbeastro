class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :delete, :show_ingredient, :update, :destroy, :delete_ingredient]
  before_action :set_meal, only: [:index, :new, :show, :edit, :create, :update, :delete, :destroy]

  def index
    @ingredients = @meal.ingredients
  end

  def show
  end

  def new
    @ingredient = @meal.ingredients.new 
  end

  def show_all
    @ingredients = Ingredient.all
  end

  def show_ingredient
  end

  def new_ingredient
    @ingredient = Ingredient.new
    #redirect_to ingredients_path#:controller => "ingredients", :action =>"create_ingredient"
  end

  def create_ingredient
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
    redirect_to @ingredient
  end

  def create
    @ingredient = @meal.ingredients.find_or_create_by(ingredient_params)
    redirect_to @meal
  end

  def delete_ingredient
    @ingredient.destroy
    redirect_to ingredients_path
  end

  def destroy
    @relationship = @meal.meal_ingredients.find_by_ingredient_id(@ingredient)
    @relationship.destroy
    redirect_to @meal
  end

  def update
    @join = @meal.meal_ingredients.create(ingredient: @ingredient)
    redirect_to @meal
  end


  def edit
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def set_meal 
    @meal = Meal.find(params[:meal_id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
