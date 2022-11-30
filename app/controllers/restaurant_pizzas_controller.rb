class RestaurantPizzasController < ApplicationController
    def create
        pr = RestaurantPizza.create!(pr_params)
        render json: pr.pizza, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private
    def pr_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end
end 
