# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Generate fake writings with chapters
10.times do
   writing = Writing.create!(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraphs(number: 5).join("\n\n"),
    user: User.first # or random user
  )

   # Generate chapters for each writing
   rand(5..20).times do |i|
     Chapter.create!(
       writing: writing,
       title: "Chapter #{i + 1}: #{Faker::Book.genre}",
       content: Faker::Lorem.paragraphs(number: 5).join("\n\n")
     )
   end
end

puts "Seeded writings and chapters!"

if true
puts "hi"
end
