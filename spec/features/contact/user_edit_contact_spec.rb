require 'rails_helper'

feature 'User edit contact' do
  scenario 'successfully' do
    contact = create(:contact)
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Listas de Contatos'
    click_on contact.name
    click_on 'Editar'
    fill_in 'Nome', with: 'Tolkien'
    fill_in 'E-mail', with: 'jrr@tolkien.com'
    fill_in 'Telefone', with: '0'
    click_on 'Salvar'

    expect(page).to have_content('Tolkien')
    expect(page).to_not have_content(contact.name)
  end
end