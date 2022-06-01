class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
  has_one :disbursement

  scope :completed, -> { where.not(created_at: nil) }

end
