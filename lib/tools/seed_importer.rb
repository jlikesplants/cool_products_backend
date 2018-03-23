class SeedImporter 
  require 'csv'
  
  def initialize(file)
    @file = file 
  end
    
  def import
    CSV.foreach(@file, headers: true) do |row|
      product_name = row["Product Name"]
      advertiser_name = row["Advertiser"]
      sku = row["SKU"]
      
      product = create_product(product_name)
      
      advertiser = create_advertiser(advertiser_name)
      
      create_sku(product, advertiser, sku)
    end
  end
  
  def create_product(product_name)
    Product.find_or_create_by(name: product_name)
  rescue => err 
    puts err.to_s 
  end
  
  def create_advertiser(advertiser_name)
    Advertiser.find_or_create_by(name: advertiser_name)
  rescue => err 
    puts err.to_s 
  end
  
  def create_sku(product, advertiser, sku)
    Sku.create(advertiser: advertiser, product: product, sku: sku)
  rescue => err 
    puts err.to_s 
    puts "Combination of product, advertiser, and sku must be unique."
  end
  
end
