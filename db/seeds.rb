10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

Category.create!(name: 'Engineer')
Category.create!(name: 'Gamer')
Category.create!(name: 'Video creator')

20.times do |index|
  Post.create!(
    user: User.offset(rand(User.count)).first,
    body: "本文#{index}"
  )
end

20.times do
  PostCategory.create!(
    category: Category.offset(rand(Category.count)).first,
    post: Post.offset(rand(Post.count)).first
  )
end