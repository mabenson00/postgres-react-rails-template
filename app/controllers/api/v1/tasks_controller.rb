# app/controllers/api/v1/tasks_controller.rb

module Api
  module V1
    class TasksController < ApplicationController
      before_action :set_task, only: %i[show update destroy]

      # GET /tasks
      def index
        tasks = Task.all
        render json: TaskBlueprint.render(tasks)
      end

      # GET /tasks/:id
      def show
        render json: TaskBlueprint.render(@task)
      end

      # POST /tasks
      def create
        task = Task.new(task_params)
        if task.save
          render json: TaskBlueprint.render(task), status: :created
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tasks/:id
      def update
        if @task.update(task_params)
          render json: TaskBlueprint.render(@task)
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tasks/:id
      def destroy
        @task.destroy
        head :no_content
      end

      private

      def set_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:title, :description, :completed, :due_date)
      end
    end
  end
end
