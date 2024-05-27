module Mutations
  class CreateTask < BaseMutation
    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    argument :task_input, Types::TaskInputType, required: true

    def resolve(task_input:)
      task = Task.new
      task.assign_attributes(task_input.to_h)
      if task.save
        {
          task:,
          errors: []
        }
      else
        {
          task: nil,
          errors: task.errors.full_messages
        }
      end
    end
  end
end
