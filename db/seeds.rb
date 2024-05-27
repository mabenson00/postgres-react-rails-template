# db/seeds.rb

require 'factory_bot_rails'

# Clear existing data
Task.delete_all

# Create tasks using the FactoryBot factory
10.times do
  FactoryBot.create(:task)
end

puts "Created 10 tasks"
