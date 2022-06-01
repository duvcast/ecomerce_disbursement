require "test_helper"

class DisbursementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disbursement = disbursements(:one)
  end

  test "should get index" do
    get disbursements_url
    assert_response :success
  end

  test "should get new" do
    get new_disbursement_url
    assert_response :success
  end

  test "should create disbursement" do
    assert_difference("Disbursement.count") do
      post disbursements_url, params: { disbursement: { amount: @disbursement.amount, order_id: @disbursement.order_id } }
    end

    assert_redirected_to disbursement_url(Disbursement.last)
  end

  test "should show disbursement" do
    get disbursement_url(@disbursement)
    assert_response :success
  end

  test "should get edit" do
    get edit_disbursement_url(@disbursement)
    assert_response :success
  end

  test "should update disbursement" do
    patch disbursement_url(@disbursement), params: { disbursement: { amount: @disbursement.amount, order_id: @disbursement.order_id } }
    assert_redirected_to disbursement_url(@disbursement)
  end

  test "should destroy disbursement" do
    assert_difference("Disbursement.count", -1) do
      delete disbursement_url(@disbursement)
    end

    assert_redirected_to disbursements_url
  end
end
