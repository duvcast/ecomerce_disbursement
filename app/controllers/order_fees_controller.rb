class OrderFeesController < ApplicationController
  before_action :set_order_fee, only: %i[ show edit update destroy ]

  # GET /order_fees or /order_fees.json
  def index
    @order_fees = OrderFee.all
  end

  # GET /order_fees/1 or /order_fees/1.json
  def show
  end

  # GET /order_fees/new
  def new
    @order_fee = OrderFee.new
  end

  # GET /order_fees/1/edit
  def edit
  end

  # POST /order_fees or /order_fees.json
  def create
    @order_fee = OrderFee.new(order_fee_params)

    respond_to do |format|
      if @order_fee.save
        format.html { redirect_to order_fee_url(@order_fee), notice: "Order fee was successfully created." }
        format.json { render :show, status: :created, location: @order_fee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_fees/1 or /order_fees/1.json
  def update
    respond_to do |format|
      if @order_fee.update(order_fee_params)
        format.html { redirect_to order_fee_url(@order_fee), notice: "Order fee was successfully updated." }
        format.json { render :show, status: :ok, location: @order_fee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_fees/1 or /order_fees/1.json
  def destroy
    @order_fee.destroy

    respond_to do |format|
      format.html { redirect_to order_fees_url, notice: "Order fee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_fee
      @order_fee = OrderFee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_fee_params
      params.require(:order_fee).permit(:amount, :order_id)
    end
end
