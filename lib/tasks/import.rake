require 'csv'
require 'tools/seed_importer'

namespace :import do
  desc 'Read products from CSV'
  task :csv, [:file] => :environment do |t, args|
    if !args[:file]
      puts "Please enter filepath in format `rake import:csv\\['filepath'\\]`."
    else
      file = args[:file]
      SeedImporter.import_csv(file)
    end
  end
end
