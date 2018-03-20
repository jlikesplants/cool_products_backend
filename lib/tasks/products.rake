require 'csv'

namespace :products do
  desc 'Read products from CSV'
  task :import, [:file] => :environment do |t, args|
    file = args[:file]
    Product.import(file)
  end
end
