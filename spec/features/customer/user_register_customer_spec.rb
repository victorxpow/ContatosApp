require 'rails_helper'

feature 'User create customer' do
  scenario 'Successfully' do
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Clientes'
    click_on 'Registrar Novo'
    fill_in 'Nome', with: 'Douglas Adams'
    fill_in 'E-mail', with: 'douglas@gmail.com'
    fill_in 'Telefone', with: '(42) 4242-4242'
    click_on 'Salvar'

    expect(page).to have_content('Douglas Adams')
    expect(page).to have_content('douglas@gmail.com')
    expect(page).to have_content('(42) 4242-4242')
  end
end