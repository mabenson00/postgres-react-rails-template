# app/graphql/types/query_type.rb
module Types
  class QueryType < Types::BaseObject
    field :tasks, [Types::TaskType], null: false

    def tasks
      puts "Fetching tasks..."
      tasks = Task.all
      tasks.each { |task| puts "Task: #{task.inspect}" }
      tasks
    end
  end
end
