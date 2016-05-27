100.times do |n|

  u = User.new(user_name: Faker::Name.name)
  u.password = ('1234')

  u2 = User.new(user_name: Faker::Name.name)
  u2.password = ('1234')

  u.save
  u2.save

  t = Tweet.create(content: Faker::Address.street_address, user_id: u.id)
  t2 = Tweet.create(content: Faker::Address.street_name, user_id: u2.id)


end

100.times do |n|
  f = Following.create(follower_id: rand(1..100), followee_id: rand(1..100))
  end


