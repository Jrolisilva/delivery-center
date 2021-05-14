class Order < ApplicationRecord
    validates :external_code, :store_id, :subtotal, :shipping_cost, :total, :date_created, presence: true
    validates :external_code, uniqueness: { case_sensitive: false }
    validates :subtotal, :shipping_cost, :total, numericality: { greater_than_or_equal_to: 0 }
    validate :total_sum
    validate :total_paid
  
    belongs_to :client
    belongs_to :shipping_address
    has_many :payments, dependent: :destroy
    has_many :order_products
    has_many :products, through: :order_product
  
    def total_sum
      return if total.blank? || subtotal.blank? || shipping_cost.blank?
      return if total == subtotal + shipping_cost
    end
  
    def total_paid
      payment_sum = payments.map(&:value).reduce(&:+)
      return if payment_sum == total
    end
end
