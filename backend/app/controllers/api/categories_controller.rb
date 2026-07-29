class Api::CategoriesController < ApplicationController
  # Retrieve all categories sorted alphabetically
  def index
    categories = Category.order(:name)
    render json: categories
  end

  # Create a new custom category
  def create
    category = Category.new(category_params)

    if category.save
      render json: category, status: :created
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Safe params validation for category
  def category_params
    params.require(:category).permit(:name)
  end
end
