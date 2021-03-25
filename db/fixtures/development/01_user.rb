10.times do
  User.seed do |s|
    s.name = Faker::Name.name,
    s.email = Faker::Internet.email,
    s.password = 'password',
    s.password_confirmation = 'password'
  end
end