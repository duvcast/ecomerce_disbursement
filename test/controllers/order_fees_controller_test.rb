require "test_helper"

class OrderFeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_fee = order_fees(:one)
  end

  test "should get index" do
    get order_fees_url
    assert_response :success
  end

  test "should get new" do
    get new_order_fee_url
    assert_response :success
  end

  test "should create order_fee" do
    assert_difference("OrderFee.count") do
      post order_fees_url, params: { order_fee: { amount: @order_fee.amount, order_id: @order_fee.order_id } }
    end

    assert_redirected_to order_fee_url(OrderFee.last)
  end

  test "should show order_fee" do
    get order_fee_url(@order_fee)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_fee_url(@order_fee)
    assert_response :success
  end

  test "should update order_fee" do
    patch order_fee_url(@order_fee), params: { order_fee: { amount: @order_fee.amount, order_id: @order_fee.order_id } }
    assert_redirected_to order_fee_url(@order_fee)
  end

  test "should destroy order_fee" do
    assert_difference("OrderFee.count", -1) do
      delete order_fee_url(@order_fee)
    end

    assert_redirected_to order_fees_url
  end
end
