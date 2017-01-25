5.times do
  category = Category.create({title: Faker::Book.title})

  5.times do
    category.posts.create({title: Faker::Book.title,body: Faker::Lorem.sentence})
  end
end
