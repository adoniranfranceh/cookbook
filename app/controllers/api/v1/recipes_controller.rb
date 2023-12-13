class Api::V1::RecipesController < ActionController::API
  def search
    recipes = Recipe.where('title LIKE ?', 
                           "%#{params[:q]}%")
    render status: 200, json: recipes
  end
end
