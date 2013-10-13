class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def show
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.save
  end

  def update
  end

  def edit
  end

  def destroy
    @meal.destroy
  end

  private

  def meal_params
    params.require(:menu).permit(:name, :price, :course)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

end
