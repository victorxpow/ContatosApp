require 'rails_helper'

feature 'User delete contact' do
  scenario 'Successfully' do
    contact = create(:contact)
    other_contact = create(:contact, name: 'Jake Peralta',
                                       email: 'jakep@nypd.com',
                                       phone: '911')
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Contatos'
    click_on contact.name
    click_on 'Apagar'

    expect(current_path).to eq(contacts_path)
    expect(page).to_not have_content(contact.name)
    expect(page).to have_content(other_contact.name)
  end
end
