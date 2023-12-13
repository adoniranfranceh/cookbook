require 'rails_helper'

describe 'recipe API' do
  context 'GET /api/v1/recipes/search' do
    it 'sucess' do
    	user = User.create!(email: 'user@email.com', password: '123456', role: :user)
      dessert = RecipeType.create!(name: 'Sobremesa')
      Recipe.create!(title: 'Manjar', cook_time: 60,
                    user: user,
                    recipe_type: dessert,
                    ingredients: 'leite condensado, leite, leite de coco',
                    instructions: 'Misture tudo, leve ao fogo e mexa, leve a geladeira')
      Recipe.create!(title: 'Hamburguer', cook_time: 10,
              user: user,
              recipe_type: dessert,
              ingredients: 'hamburguer, pão de hamburguer, queijo',
              instructions: 'Frite o hamburguer, coloque no pão, coma')

      get search_api_v1_recipes_path, params: { q: 'Manjar' }

      expect(response.status).to eq 200
      expect(response.body).to include('Manjar')
      expect(response.body).to include('60')
      expect(response.body).not_to include('Hamburguer')
    end
  end
end
