require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "1% fee for amounts smaller than 50 €" do
    order = Order.new(amount: 30.0 ,completed_at: DateTime.now)
    fee = CalculateFee.new(order).calculate_fee

    assert_equal( fee, (30.0 * 0.01), ['Calculate fee for the order'] )
  end

  test "0.95% for amounts between 50€ - 300€" do
    order = Order.new(amount: 100.0 ,completed_at: DateTime.now)
    fee = CalculateFee.new(order).calculate_fee

    assert_equal( fee, (100.0 * 0.095), ['Calculate fee for the order'] )
  end

  test "0.85% for amounts over 300€" do
    order = Order.new(amount: 500.0 ,completed_at: DateTime.now)
    fee = CalculateFee.new(order).calculate_fee

    assert_equal( fee, (500.0 * 0.085), ['Calculate fee for the order'] )
  end

  test "Without amount" do
    order = Order.new(completed_at: DateTime.now)
    fee = CalculateFee.new(order).calculate_fee

    assert_nil( fee, ['Shold return Nil'] )
  end

  test "Create order fee" do
    shopper = Shopper.create!(name: Faker::Name.name, email: Faker::Internet.email, nif: Faker::Number.number(10))
    merchant = Merchant.create!(name: Faker::Name.name, email: Faker::Internet.email, cif: Faker::Number.number(10))

    order = Order.create!(amount: 100.0, completed_at: DateTime.now - 30.day, shopper_id: shopper.id,
                          merchant_id: merchant.id)
    fee = CalculateFee.new(order).calculate_fee
    
    OrderFee.create!(amount: fee, order_id: order.id)
    
    assert_not_nil( OrderFee.all, ['Create order fee'] )
  end

  test "Create order fees for a especific week" do
    date_from = DateTime.now.beginning_of_week
    date_to = DateTime.now.end_of_week
    shopper = Shopper.create!(name: Faker::Name.name, email: Faker::Internet.email, nif: Faker::Number.number(10))
    merchant = Merchant.create!(name: Faker::Name.name, email: Faker::Internet.email, cif: Faker::Number.number(10))
    
    OrderFee.delete_all
    Order.delete_all

    Order.create!(amount: 100.0, completed_at: date_from + 1.day, shopper_id: shopper.id, merchant_id: merchant.id)
    Order.create!(amount: 100.0, completed_at: date_from + 2.day, shopper_id: shopper.id, merchant_id: merchant.id)
    Order.create!(amount: 100.0, completed_at: date_from - 20.day, shopper_id: shopper.id, merchant_id: merchant.id)

    Order.calculate_all_fees_per_week(date_from, date_to)
    
    assert_equal( OrderFee.all.count, 2, ['Calculate fees for the orders in the week (2)'] )
  end

  test "Calculate the disburse" do
    shopper = Shopper.create!(name: Faker::Name.name, email: Faker::Internet.email, nif: Faker::Number.number(10))
    merchant = Merchant.create!(name: Faker::Name.name, email: Faker::Internet.email, cif: Faker::Number.number(10))

    order = Order.create!(amount: 100.0, completed_at: DateTime.now - 30.day, shopper_id: shopper.id,
                          merchant_id: merchant.id)
    fee = CalculateFee.new(order).calculate_fee
    
    OrderFee.create!(amount: fee, order_id: order.id)
    
    assert_equal( order.disburse, (100.0 - (100.0 * 0.095 )) , ['Calculate disburse for the order'] )
  end

end
