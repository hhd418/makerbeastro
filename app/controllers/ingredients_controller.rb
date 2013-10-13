class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy, :show_ingredient]
  before_action :set_meal, only: [:index, :new, :show, :edit]

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
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to @ingredient
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
