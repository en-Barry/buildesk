10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

Category.create!(name: 'Engineer')
Category.create!(name: 'Writer')
Category.create!(name: 'MediaCreator')
