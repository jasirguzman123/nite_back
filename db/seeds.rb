require 'ffaker'
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

users = []

10.times do
  users << User.create!(
    email: FFaker::Internet.email, 
    password: '123456', 
    name: FFaker::Name.first_name, 
    last_name: FFaker::Name.last_name, 
    phone: FFaker::PhoneNumber.short_phone_number,
    birthdate: FFaker::Time.date
  )
end

categories = []

10.times do
  categories << Category.create!(name: FFaker::Lorem.word)
end

localities = []

prices = [10000, 45000, 150000, 300000]

users.each do |user|
  3.times do
    event = user.events.create!(
      name: FFaker::Lorem.word,
      address: FFaker::Address.street_address,
      starting_hour: FFaker::Time.date,
      ending_hour: FFaker::Time.date,
      description: FFaker::Lorem.words(10).join(' ')
    )
    event.categories << categories.sample
    5.times do
      event.localities.create!(name: FFaker::Lorem.word, price: prices.sample, description: FFaker::Lorem.words(5).join(' '))
    end
  end
end