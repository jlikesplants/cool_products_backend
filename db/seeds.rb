# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

advertisers = Advertiser.create(name: 'Nike')
  
products = Product.create([
    { name: 'Aerodynamic Aluminum Bag',
      sku: '089128ca-3bca-4125-a151-833d7fc6d9af',
      advertiser_id: Advertiser.first.id
    },
    { name: 'Aerodynamic Granite Hat',
      sku: 'c5f0dd0d-91b9-4729-92b1-1499555ca3c7',
      advertiser_id: Advertiser.first.id
    },
    { name: 'Lightweight Linen Hat',
      sku: '25968e80-2962-4e20-9d71-7e54fb69a47b',
      advertiser_id: Advertiser.first.id
    }
  ])


