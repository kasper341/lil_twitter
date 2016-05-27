100.times do |n|

  u = User.new(user_name: Faker::Name.name)
  u.password = ('1234')

  u2 = User.new(user_name: Faker::Name.name)
  u2.password = ('1234')

  u.save
  u2.save

  f = Following.create(follower_id: u2.id, followee_id: u.id)
  t = Tweet.create(content: Faker::Address.street_address, user_id: u.id)
  t2 = Tweet.create(content: Faker::Address.street_name, user_id: u2.id)


end


