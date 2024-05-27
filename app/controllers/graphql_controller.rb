# app/controllers/graphql_controller.rb
class GraphqlController < ApplicationController
  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {}
    result = TaskManagerSchema.execute(query, variables:, context:, operation_name:)
    render json: result
  rescue StandardError => e
    render json: { errors: [{ message: e.message, backtrace: e.backtrace }] }, status: :internal_server_error
  end

  private

  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash
    else
      {}
    end
  end
end
