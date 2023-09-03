class CartItem < ApplicationRecord

  belongs_to :items
  validates :amount, presence: true

end
