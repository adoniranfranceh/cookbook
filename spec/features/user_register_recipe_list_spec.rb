require 'rails_helper'

feature 'Usuário cria lista de receita' do
  scenario 'com sucesso' do
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

    login_as user, scope: :user
    visit root_path
    click_on 'Minhas listas'
    click_on 'Criar nova lista'

    expect(page).to have_field('Nome')
    expect(page).to have_button('Salvar')
  end
end
