require 'rails_helper'

feature 'User delete customer' do
  scenario 'Successfully' do
    customer = create(:customer)
    other_customer = create(:customer, name: 'Edgar A Poe',
                                       email: 'edgar@gmail.com',
                                       phone: '(12) 98216-2277')
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on customer.name
    click_on 'Apagar'

    expect(current_path).to eq(customers_path)
    expect(page).to_not have_content(customer.name)
    expect(page).to have_content(other_customer.name)
  end
end
