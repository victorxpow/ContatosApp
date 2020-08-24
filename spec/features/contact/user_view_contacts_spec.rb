require 'rails_helper'

feature 'User view contacts' do
  scenario 'successfully' do
    user = create(:user)
    contact = create(:contact)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Contatos'

    expect(page).to have_content(contact.name)
    expect(page).to have_content(contact.email)
    expect(page).to have_content(contact.phone)
  end
end