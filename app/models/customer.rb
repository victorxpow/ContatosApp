class Customer < ApplicationRecord
  has_many :customer_contacts
  has_many :contacts, through: :customer_contacts
end
