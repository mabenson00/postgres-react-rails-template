# app/blueprints/task_blueprint.rb

class TaskBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :description, :completed, :due_date, :created_at, :updated_at
end
