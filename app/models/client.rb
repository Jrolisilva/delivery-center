class Client < ApplicationRecord
  validates :external_code, :name, :email, :contact, presence: true
  validates :external_code, :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :shipping_address, dependent: :destroy
  has_many :orders, dependent: :destroy
end
