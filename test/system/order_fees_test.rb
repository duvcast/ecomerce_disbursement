require "application_system_test_case"

class OrderFeesTest < ApplicationSystemTestCase
  setup do
    @order_fee = order_fees(:one)
  end

  test "visiting the index" do
    visit order_fees_url
    assert_selector "h1", text: "Order fees"
  end

  test "should create order fee" do
    visit order_fees_url
    click_on "New order fee"

    fill_in "Amount", with: @order_fee.amount
    fill_in "Order", with: @order_fee.order_id
    click_on "Create Order fee"

    assert_text "Order fee was successfully created"
    click_on "Back"
  end

  test "should update Order fee" do
    visit order_fee_url(@order_fee)
    click_on "Edit this order fee", match: :first

    fill_in "Amount", with: @order_fee.amount
    fill_in "Order", with: @order_fee.order_id
    click_on "Update Order fee"

    assert_text "Order fee was successfully updated"
    click_on "Back"
  end

  test "should destroy Order fee" do
    visit order_fee_url(@order_fee)
    click_on "Destroy this order fee", match: :first

    assert_text "Order fee was successfully destroyed"
  end
end
