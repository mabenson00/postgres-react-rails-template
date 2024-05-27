module Mutations
  class UpdateTaskCompletion < Mutations::BaseMutation
    argument :task_input, Types::UpdateTaskCompletionInput, required: true, as: :input

    field :task, Types::TaskType, null: false

    def resolve(input:)
      task = Task.find(input[:id])
      task.update!(completed: input[:completed])
      { task: }
    end
  end
end
