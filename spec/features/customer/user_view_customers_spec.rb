require 'rails_helper'

feature 'User view client' do
  scenario 'successfully' do
    user = create(:user)
    customer = create(:customer)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Cliente'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
    expect(page).to have_content(customer.created_at)
  end
end