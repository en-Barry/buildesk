10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    uuid: SecureRandom.alphanumeric(10)
  )
end

User.create!(
  name: 'Mikasa',
  email: 'mikasa@attack.com',
  password: 'aaaaaaaa',
  password_confirmation: 'aaaaaaaa',
  uuid: 'mikasa210',
  role: 1
)

User.create!(
  name: 'Eren',
  email: 'eren@attack.com',
  password: 'aaaaaaaa',
  password_confirmation: 'aaaaaaaa',
  uuid: 'eren330'
)
