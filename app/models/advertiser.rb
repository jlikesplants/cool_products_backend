class Advertiser < ApplicationRecord
  has_many :skus
  has_many :products, through: :skus
  validates :name, presence: true, uniqueness: true
end
