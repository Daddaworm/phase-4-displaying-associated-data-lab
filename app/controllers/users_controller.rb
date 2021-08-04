class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # GET /users/:id
    def show
        # byebug
        user = find_user
        render json: user, include: :items
    end



    private

    def find_user
        user = User.find_by(params[:id])
    end

    def render_not_found_response
        render json: { error: "User not found" }, status: :not_found
    end
end
