# app/graphql/mutations/update_task_completion.rb
module Mutations
  class UpdateTaskCompletion < Mutations::BaseMutation
    argument :input, Types::TaskInputType, required: true

    field :task, Types::TaskType, null: false

    def resolve(input:)
      task = Task.find(input.id)
      task.update!(completed: input.completed)
      { task: }
    end
  end
end
