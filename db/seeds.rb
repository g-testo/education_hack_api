# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text_character = File.read(Rails.root.join('lib', 'seeds', 'objects.csv'))

csv_objects = CSV.parse(csv_text_character, :headers => true, :encoding => 'ISO-8859-1')

csv_objects.each do |row|

  obj = LanguageObject.new
  obj.submitted_by = row['submitted_by']
  obj.image_url = row['object_image_url']
  obj.object_local_language = row['object_local_language']
  obj.object_local_name = row['object_local_name']
  obj.community_group = row['object_community_group']
  obj.category = row['object_category']
  obj.trust_rating = row['trust_rating']
  obj.save
end

puts "There are now #{LanguageObject.count} object rows in the transactions table"
