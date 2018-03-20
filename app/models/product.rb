class Product < ApplicationRecord
  require 'csv'
  
  validates :name, :sku, presence: true
  
  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      print row
    end
  end
end
