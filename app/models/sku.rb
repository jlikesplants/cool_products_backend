class Sku < ApplicationRecord
  belongs_to :product
  belongs_to :advertiser
  validates :sku, presence: true
end
