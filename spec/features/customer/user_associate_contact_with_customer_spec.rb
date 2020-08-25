require 'rails_helper'

feature 'User edit customer' do
  scenario 'successfully' do
    customer = create(:customer)
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on customer.name
    click_on 'Adicionar contato'
    fill_in 'Nome', with: 'George R R Martin'
    fill_in 'E-mail', with: 'george@martin.com'
    fill_in 'Telefone', with: '0800-V4L4R'
    click_on 'Salvar'

    expect(page).to have_content('George R R Martin')
    expect(page).to_not have_content(customer.name)
  end
end