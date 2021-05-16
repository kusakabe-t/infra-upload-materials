module Api
  class TasksController < ApplicationController
    def index
      tasks = Task.all

      render json: tasks, status: :ok
    end

    def show
      task = Task.find_by(id: params[:id])

      render json: task, status: :ok
    end

    def create
      task = Task.new(request_params)
      task.save!
      
      
      render json: task, status: :created
    end

    def update
      task = Task.find_by(id: params[:id])
      task.update(request_params)
      task.save!

      render json: task, status: :ok
    end

    def destroy
      task = Task.find_by(id: params[:id])
      task.destroy
      head :no_content
    end

    private

    def request_params
      params.permit(:name, :is_done, :time)
    end
  end
end