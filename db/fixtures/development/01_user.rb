10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

User.create!(
  name: 'Mikasa',
  email: 'mikasa@attack.com',
  password: 'aaaaaaaa',
  password_confirmation: 'aaaaaaaa'
)
