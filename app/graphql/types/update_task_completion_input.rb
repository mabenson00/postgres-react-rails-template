module Types
  class UpdateTaskCompletionInput < Types::BaseInputObject
    argument :id, ID, required: true
    argument :completed, Boolean, required: true
  end
end
