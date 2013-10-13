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
    redirect_to @meal
  end

 

  def edit
  end

  def update
    @meal.update(meal_params)
    redirect_to @meal
  end

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :price, :course)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

end
