module Queries
  class FetchTasks < Queries::BaseQuery
    type [Types::TaskType], null: false

    def resolve
      Task.all
    end
  end
end
