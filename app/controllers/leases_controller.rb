class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    private 

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end
end
