5.times do |n|
  Post.seed do |s|
    s.id = n
    s.body = "test"
    s.area = 0
    s.user_id = User.offset(rand(User.count)).first.id
  end
end