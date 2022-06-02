class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
  has_one :order_fee, dependent: :delete

  scope :completed, -> { where.not(completed_at: nil) }
  scope :date_range, ->(date_from, date_to) { where('completed_at >= ? AND completed_at <= ?', date_from, date_to) }

  ##
  # Calculate all the completed orders fees and create a record.
  # in a given week or rangue of dates
  ##
  def self.calculate_all_fees_per_week(date_from, date_to)
    return if date_from > date_to

    Order.date_range(date_from, date_to).completed.each do |order|
      current_fee = CalculateFee.new(order).calculate_fee
      OrderFee.create(amount: current_fee, order: order)
    end
  end

end
