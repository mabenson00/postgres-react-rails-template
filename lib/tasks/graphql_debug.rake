# lib/tasks/graphql_debug.rake
namespace :graphql do
  desc "Print all types in the schema"
  task types: :environment do
    TaskManagerSchema.types.each do |type|
      puts type
    end
  end
end
