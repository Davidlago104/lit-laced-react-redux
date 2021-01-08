class Api::SneakersController < ApplicationController
    before_action :set_sneaker, only: [:show, :update, :destroy]
    def index
        render json: Sneaker.all
    end

    def show
        render json: Sneaker.find_by(id: params[:id])
    end

    def create
        sneaker = Sneaker.new(sneaker_params)
        if sneaker.save
            render json: sneaker
        else
            render json: {message: sneaker.errors }, status: 400
        end
    end

    def update
        if @sneaker.update(sneaker_params)
            render json: @sneaker
        else
            render json: {message: sneaker.errors}, status: 400
        end
    end

    def destroy
        if @sneaker.destroy
            render status: 204
        else
            render json: {message: sneakers.errors}, status: 400
        end
    end

    private
    def set_sneaker
        @sneaker = Sneaker.find_by(id: params[:id])
    end

    def sneaker_params
        params.require(:sneaker).permit(:name, :image_url, :price)
    end
end