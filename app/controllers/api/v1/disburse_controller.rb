module Api::V1
  class DisbursesController < ActionController::API

    ##
    # Disburses API
    ##
    def disbursements_by_merchant_by_week
      render json: Orders.date_range(params[:date_from], params[:date_to]).pluck(:disburse).as_json unless Merchant.find_by_name(params[:merchant_name]).present? 
      render json: Merchant.find_by_name(params[:merchant_name]).orders.date_range(params[:date_from], params[:date_to]).pluck(:disburse).as_json
    end
  end
end