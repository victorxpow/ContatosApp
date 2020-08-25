class CreateCustomerContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_contacts do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
