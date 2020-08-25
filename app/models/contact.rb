class Contact < ApplicationRecord
  has_many :customer_contacts
  has_many :customers, through: :customer_contacts
end
