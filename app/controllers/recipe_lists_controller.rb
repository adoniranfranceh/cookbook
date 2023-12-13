class RecipeListsController < ApplicationController
  def index
    @recipe_lists = RecipeList.all 
  end

  def new
    @recipe_list = RecipeList.new
  end

  def create
  end
end