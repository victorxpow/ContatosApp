require 'rails_helper'

feature 'User edit customer' do
  scenario 'successfully' do
    customer = create(:customer)
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Clientes'
    click_on customer.name
    click_on 'Editar'
    fill_in 'Nome', with: 'George R R Martin'
    fill_in 'E-mail', with: 'george@martin.com'
    fill_in 'Telefone', with: '0800-V4L4R'
    click_on 'Salvar'

    expect(page).to have_content('George R R Martin')
    expect(page).to_not have_content(customer.name)
  end

  scenario 'Duplicated fields' do
    user = create(:user)
    customer = create(:customer)
    other_customer = create(:customer, name: 'Jon', phone: '(11) 96782-4553',
                      email: 'douglas@gmail.com')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Clientes'
    click_on customer.name
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