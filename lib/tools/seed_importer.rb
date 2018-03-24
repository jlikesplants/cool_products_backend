class SeedImporter 
  require 'csv'
  require 'activerecord-import'
  require 'smarter_csv'
  
  def initialize(file)
    @file = file 
  end
  
  def read_csv
    SmarterCSV.process(@file)
  end
  
  
  def import_csv
    csv_data = read_csv
      
    products = []
    advertisers = []
    csv_data.each do |data|
      product = Product.new(name: data[:product_name])
      products << product
      
      advertiser = Advertiser.new(name: data[:advertiser])
      advertisers << advertiser
    end
    
    puts "Importing products..."
    Product.import(products)
    
    puts "Importing advertisers..."
    Advertiser.import(advertisers)
    
    import_skus(csv_data)
  end
  
  def import_skus(row_data)
    start = Time.now
    skus = []
    row_data.each do |row|
      product = Product.find_by(name: row[:product_name])
      advertiser = Advertiser.find_by(name: row[:advertiser])
      
      skus << Sku.new(advertiser: advertiser, product: product, sku: row[:sku])
    end
    
    puts "Importing skus..."
    Sku.import(skus)
    finished = Time.now
    puts "All done.... it took #{finished - start}"
  end
end

