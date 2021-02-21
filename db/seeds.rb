10.time do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

20.time do |index|
  Post.create!(
    user: User.offset(rand(User.count))first,
    body: "本文#{index}"
  )
end
