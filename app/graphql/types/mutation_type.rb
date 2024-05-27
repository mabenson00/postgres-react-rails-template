# app/graphql/types/mutation_type.rb
module Types
  class MutationType < Types::BaseObject
    field :create_task, mutation: Mutations::CreateTask
    field :update_task_completion, mutation: Mutations::UpdateTaskCompletion
  end
end
