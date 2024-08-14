# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([
  {name: 'John Doe', email: 'john@example.com', image: 'http://example.com/john.jpg'},
  {name: 'Jane Smith', email: 'jane@example.com', image: 'http://example.com/jane.jpg'},
  {name: 'Alice Johnson', email: 'alice@example.com', image: 'http://example.com/alice.jpg'}
])
