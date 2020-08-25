require 'rails_helper'

feature 'User can associate customer with a contact' do
  scenario 'successfully' do
    customer = create(:customer)
    contact = create(:contact)
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Clientes'
    click_on customer.name
    click_on 'Adicionar contato'
    check 'MyString'
    click_on 'Confirmar'
    click_on 'Lista de Clientes'
    click_on customer.name

    expect(page).to have_content('MyString')
  end

  scenario 'when have no contact' do
    customer = create(:customer)
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Clientes'
    click_on customer.name
    click_on 'Adicionar contato'

    expect(page).to have_content('Não há contatos disponiveis')
  end
end