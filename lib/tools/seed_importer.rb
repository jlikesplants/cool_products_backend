class SeedImporter 
  require 'csv'
  require 'activerecord-import'
  
  def initialize(file)
    @file = file 
  end
    
  def import_csv
    products = []
    advertisers = []
    row_data = []
    
    start = Time.now
    
    CSV.foreach(@file, headers: true) do |row|      
      product_name = row["Product Name"]
      advertiser_name = row["Advertiser"]
      sku = row["SKU"]
      
      print "Reading CSV row: #{row}"

      row_data << row
      
      product = Product.new(name: product_name)
      products << product

      advertiser = Advertiser.new(name: advertiser_name)
      advertisers << advertiser
      
    end
    
    Product.import(products)
    Advertiser.import(advertisers)
    
    import_skus(row_data)
    
    finished = Time.now
    puts "All done.... it took #{finished - start}"
  end
  
  def import_skus(row_data)
    skus = []
    row_data.each do |row|
      print "Sku seeding row: #{row}"
      product = Product.find_by(name: row["Product Name"])
      advertiser = Advertiser.find_by(name: row["Advertiser"])
      
      skus << Sku.new(advertiser: advertiser, product: product, sku: row["SKU"])
    end
    
    Sku.import(skus)
  end
end
