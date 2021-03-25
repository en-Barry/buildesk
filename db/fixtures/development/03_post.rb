5.times do
  Post.seed do |s|
    s.body: "test_#{indes}",
    s.area: 0,
    s.user_id: User.offset(rand(User.count)).first.id
  end
end