class Customer < ApplicationRecord
  has_many :customer_contacts, dependent: :destroy
  has_many :contacts, through: :customer_contacts, dependent: :destroy
end
