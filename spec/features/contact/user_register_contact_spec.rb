require 'rails_helper'

feature 'User create contacts' do
  scenario 'Successfully' do
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Contatos'
    click_on 'Registrar Novo'
    fill_in 'Nome', with: 'Albus'
    fill_in 'E-mail', with: 'albus@gmail.com'
    fill_in 'Telefone', with: '(00) 0000-0000'
    click_on 'Salvar'

    expect(page).to have_content('Albus')
    expect(page).to have_content('albus@gmail.com')
    expect(page).to have_content('(00) 0000-0000')
  end
end