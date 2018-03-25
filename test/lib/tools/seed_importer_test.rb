require 'test_helper'
require 'activerecord-import'
require 'smarter_csv'
require 'tools/seed_importer'


class SeedImporterTest < ActiveSupport::TestCase
  def setup 
    @csv = File.join(File.dirname(__FILE__), 'test.csv')
    @file = SeedImporter.read_csv(@csv)
  end
  
  test 'builds array with smarter csv' do
    assert @file.is_a?(Array)
  end
  
  test 'creates a row object for each csv row' do
    assert_equal(@file.length, 14)
  end
end
