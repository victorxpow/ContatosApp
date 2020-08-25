require 'rails_helper'

feature 'User create contacts' do
  scenario 'Successfully' do
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Contatos'
    click_on 'Registrar Novo'
    fill_in 'Nome', with: 'Albus'
    fill_in 'E-mail', with: 'albus@gmail.com'
    fill_in 'Telefone', with: '(00) 0000-0000'
    click_on 'Salvar'

    expect(page).to have_content('Albus')
    expect(page).to have_content('albus@gmail.com')
    expect(page).to have_content('(00) 0000-0000')
  end

  scenario 'Duplicated fields' do
    user = create(:user)
    create(:customer, phone: '(11) 96782-4553',
                      email: 'douglas@gmail.com')

    login_as(user, scope: :user)
    visit new_customer_path
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: 'douglas@gmail.com'
    fill_in 'Telefone', with: '(11) 96782-4553'
    click_on 'Salvar'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content('Email has already been taken')
    expect(page).to have_content('Phone has already been taken')
  end
end