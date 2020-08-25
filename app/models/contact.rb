class Contact < ApplicationRecord
  has_many :customer_contacts, dependent: :destroy
  has_many :customers, through: :customer_contacts, dependent: :destroy
end
