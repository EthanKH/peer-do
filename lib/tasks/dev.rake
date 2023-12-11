desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  # https://github.com/faker-ruby/faker
  # Faker Time https://github.com/faker-ruby/faker/blob/main/doc/default/time.md
  # Faker Date https://github.com/faker-ruby/faker/blob/main/doc/default/date.md
  # Faker Zelda Names https://github.com/faker-ruby/faker/blob/main/doc/games/zelda.md

  p "Creating sample data..."

  # reset sample data
  if Rails.env.development?
    FriendRequest.destroy_all
    Ping.destroy_all
    Task.destroy_all
    User.destroy_all
  end

  # some permanent users
  # %w is a shortcut for an array of strings in ruby
  test_usernames = %w[test sample alice bob]

  test_usernames.each do |username|
    User.create(
      email: "#{username.downcase}@example.com",
      password: "password",
      username: username.downcase,
      private: [true, false].sample,
    )
  end

  #generate 15 random users
  15.times do
    og_name = p Faker::Games::Zelda.character
    fixed_name = og_name.downcase.gsub(/[^0-9a-z ]/, '').gsub(' ', '_')
    u = User.create(
      email: "#{fixed_name}@example.com",
      password: "password",
      username: fixed_name,
      private: [true, false].sample,
      og_name: og_name
    )

    p u.errors.full_messages
  end

  users = User.all

  users.each_with_index do |first_user, index|
    (index + 1).upto(users.length - 1) do |second_user_index|
      second_user = users[second_user_index]
  
      next if first_user == second_user || first_user.sent_friend_requests.exists?(receiver: second_user) || second_user.sent_friend_requests.exists?(receiver: first_user)
  
      if rand < 0.75
        first_user.sent_friend_requests.create(
          receiver: second_user,
          status: FriendRequest.statuses.keys.sample
        )
      end
    end
  end
  

  # users.each do |first_user|
  #   users.each do |second_user|
  #     next if first_user == second_user
  #     if rand < 0.75
  #       first_user.sent_friend_requests.create(
  #         receiver: second_user,
  #         status: FriendRequest.statuses.keys.sample
  #       )
  #     end
  #     if rand < 0.75
  #       second_user.sent_friend_requests.create(
  #         receiver: first_user,
  #         status: FriendRequest.statuses.keys.sample
  #       )
  #     end
  #   end
  # end

  #random task generated for each user
  users.each do |user|
    5.times do
      task = user.own_tasks.create(
        description: [
          "Practice #{Faker::Hobby.activity.downcase}",
          "Catch a #{Faker::Games::Pokemon.name}",
          "Find #{Faker::Games::Zelda.item}",
          "Eat #{Faker::Food.dish.downcase}",
        ].sample,
        due_date: Faker::Date.forward(days: 30),
        due_time: Faker::Time.forward(format: :short),
        ping_frequency: rand(1..10),
        completion: rand(0..100)
      )
      user.senders.each do |sender|
        if rand < 0.5 && !task.pokers.include?(sender)
          task.pokers << sender
        end

        if rand < 0.25
          task.pings.create(poker: sender)
        end
      end
    end
  end
  p "There are now #{User.count} users."
  p "There are now #{FriendRequest.count} friend requests."
  p "There are now #{Task.count} tasks."
  p "There are now #{Ping.count} pings."
end

# command to check params of a user in rails console  User.first.attributes
# User.find(number)
