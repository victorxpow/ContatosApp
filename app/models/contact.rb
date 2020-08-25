class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true

  has_many :customer_contacts, dependent: :destroy
  has_many :customers, through: :customer_contacts, dependent: :destroy
end
