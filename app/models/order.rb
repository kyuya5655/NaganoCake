class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details
  enum payment_method: { credit_card: 0, transfer: 1 }


  validates :customer_id, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :total_payment, presence: true
  validates :postage, presence: true
  
  def with_tax_price
    (price * 1.1).floor
  end

end
