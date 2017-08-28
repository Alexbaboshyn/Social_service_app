# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Place.delete_all
Place.create!(name: 'Beer&Blues',
              tags: ['karaoke', 'pub', 'restaurant', 'sushi'],
              city: 'Vinnytsia'
             )

Place.create!(name: 'Royal Pub',
              tags: ['pub'],
              city: 'Vinnytsia'
             )
