##
# Module responsible for calculate the fee for an order
##
class CalculateFee

  def initialize(order)
    @order = order
    @min_value = 50.0
    @max_value = 300.0
  end

  ##
  # This method calculate the fee for the Order
  # Precondition: Order must have a value in completed_at field
  # @return [Float] the fee
  ##
  def calculate_fee
    return nil if @order.amount.nil?

    if @order.amount < @min_value
      @order.amount * 0.01
    elsif (@order.amount >= @min_value && @order.amount <= @max_value )
      @order.amount * 0.095
    elsif @order.amount > @max_value
      @order.amount * 0.085
    end
  end
end