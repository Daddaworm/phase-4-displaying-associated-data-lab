class ItemsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # GET /items
    def index
        items = Item.all 
        render json: items, include: :user
    end


    private

    def render_not_found_response
        render json: { error: "Item not found" }, status: :not_found
    end



end
