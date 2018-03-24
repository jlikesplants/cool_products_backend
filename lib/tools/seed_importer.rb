class SeedImporter 
  require 'csv'
  require 'activerecord-import'
  require 'smarter_csv'

  def self.read_csv(file)
    SmarterCSV.process(file)
  end
  
  def self.import_csv(file)
    start = Time.now
    csv_data = read_csv(file)
      
    product_names = []
    products = []
    
    advertiser_names = []
    advertisers = []
    
    csv_data.each do |data|
      
      if !product_names.include?(data[:product_name])
        product = Product.new(name: data[:product_name])
        products << product
        product_names << data[:product_name]
      end
      
      if !advertiser_names.include?(data[:advertiser])
        advertiser = Advertiser.new(name: data[:advertiser])
        advertisers << advertiser
        advertiser_names << data[:advertiser]
      end
    end
    
    puts "Importing products..."
    Product.import(products)
    
    puts "Importing advertisers..."
    Advertiser.import(advertisers)
    
    puts "Importing skus..."
    import_skus(csv_data)
    
    finished = Time.now
    puts "All done.... it took #{finished - start}"
  end
  
  def self.import_skus(row_data)
    skus = []
    row_data.each do |row|
      product = Product.find_by(name: row[:product_name])
      advertiser = Advertiser.find_by(name: row[:advertiser])
      skus << Sku.new(advertiser: advertiser, product: product, sku: row[:sku])
    end
    
    Sku.import(skus)
  end
end

