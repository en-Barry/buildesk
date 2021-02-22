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

15.times do |index|
  Post.create!(
    user: User.offset(rand(User.count)).first,
    body: "本文#{index}"
  )
end

PostCategory.create!(
  category: Category.first,
  post: Post.first
)

PostCategory.create!(
  category: Category.second,
  post: Post.second
)

PostCategory.create!(
  category: Category.third,
  post: Post.third
)