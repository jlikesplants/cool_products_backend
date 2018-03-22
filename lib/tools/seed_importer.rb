class SeedImporter 
  require 'csv'
  
  def initialize(file)
    @file = file 
  end
    
  def import
    CSV.foreach(@file, headers: true, return_headers: true) do |row|
      print row
    end
  end
end