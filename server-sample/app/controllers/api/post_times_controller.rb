module Api
  class PostTimesController < ApplicationController
    def index
      post_times = PostTime.all

      render json: post_times, status: :ok
    end

    def show
      post_time = PostTime.find_by(id: params[:id])

      render json: post_time, status: :ok
    end

    def create
      post_time = PostTime.new(request_params)
      post_time.save!
      
      
      render json: post_time, status: :created
    end

    def update
      post_time = PostTime.find_by(id: params[:id])
      post_time.update(request_params)
      post_time.save!

      render json: post_time, status: :ok
    end

    def destroy
      post_time = PostTime.find_by(id: params[:id])
      post_time.destroy
      head :no_content
    end

    private

    def request_params
      params.permit(:time)
    end
  end
end