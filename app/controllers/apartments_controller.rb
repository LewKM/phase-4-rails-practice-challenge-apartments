class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index  
        apartments = Apartment.all
        render json: apartments, status: :ok
    end
end
