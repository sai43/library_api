# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |i|
  library = Library.create(name: "#{Faker::Name.unique.name} Library", address: Faker::Address.full_address)
  6.times do |i|
    author = User.create(name: Faker::Book.author, email: Faker::Internet.email, status: 1)
    user = User.create(name: Faker::Book.author, email: Faker::Internet.email, status: 1)
    status = Faker::Boolean.boolean
    Book.create(title: Faker::Book.title, 
                available: status, 
                library: library, 
                author: author, 
                checked_out_by: status ? nil : user)
  end

end

