# app/graphql/task_manager_schema.rb
class TaskManagerSchema < GraphQL::Schema
  query(Types::QueryType)
  mutation(Types::MutationType)
end
