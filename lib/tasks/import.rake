# run with rake import:csv\['filepath'\]

require 'csv'
require_relative '../tools/seed_importer'

namespace :import do
  desc 'Read products from CSV'
  task :csv, [:file] => :environment do |t, args|
    file = args[:file]
    importer = SeedImporter.new(file)
    importer.import
  end
end
