require 'rails_helper'

feature 'User edit contact' do
  scenario 'successfully' do
    contact = create(:contact)
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Contatos'
    click_on contact.name
    click_on 'Editar'
    fill_in 'Nome', with: 'Tolkien'
    fill_in 'E-mail', with: 'jrr@tolkien.com'
    fill_in 'Telefone', with: '0'
    click_on 'Salvar'

    expect(page).to have_content('Tolkien')
    expect(page).to_not have_content(contact.name)
  end

  scenario 'Duplicated fields' do
    user = create(:user)
    contact = create(:contact)
    other_contact = create(:contact, name: 'Jon', phone: '(11) 96782-4553',
                      email: 'douglas@gmail.com')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Contatos'
    click_on contact.name
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: 'douglas@gmail.com'
    fill_in 'Telefone', with: '(11) 96782-4553'
    click_on 'Salvar'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content('Email has already been taken')
    expect(page).to have_content('Phone has already been taken')
  end
end