# app/graphql/task_manager_schema.rb
class TaskManagerSchema < GraphQL::Schema
  query(Types::QueryType)
end
