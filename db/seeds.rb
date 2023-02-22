# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
Post.all.destroy_all
5.times do
  user = User.new(
    name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )
  user.save!
  5.times do
    post = Post.create!(title: Faker::Book.unique.title, user_id: user.id)
    content = "<p class=''><strong>"
    content += Faker::Lorem.paragraph_by_chars(number: rand(20..100))
    content += "</strong></p>"
    content += "<p class='small'>#{Faker::Lorem.paragraph_by_chars(number: rand(200..300))}</p>"
    content += "<br><h3> Hello </h3>"
    content += "<p>#{Faker::Lorem.paragraph_by_chars(number: rand(100..500))}</p>"
    ActionText::RichText.create!(record_type: "Post", record_id: post.id, name: "content", body: content)
  end
end
1.times do
  post = Post.create!(title: Faker::Book.unique.title, user_id: 1)
  content = '<div class="trix-content"><div><strong>Here is bold</strong>.<br><br>The text here is broken</div></div>'
  ActionText::RichText.create!(record_type: "Post", record_id: post.id, name: "content", body: content)
end
