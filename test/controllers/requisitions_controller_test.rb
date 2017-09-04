require 'test_helper'

class RequisitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requisition = Requisition.new(
      income: 9.99,
      address_years: 1,
      company_years: 1,
      marital_status: 'Casado',
      requested_amount: 9.99,
      payment_terms: 'MyString',
      bank: 'MyString',
      comment: 'MyString',
      company_name: 'MyString',
      company_phone_number: 8956312547,
      dependents_number: 1,
      company_position: 'MyString',
      has_sgmm: false,
      has_imss: false,
      has_car: false      
    )
  end

  test "should get index" do
    get requisitions_url
    assert_response :success
  end

  test "should get new" do
    get new_requisition_url
    assert_response :success
  end

  test "should create requisition" do
    assert_difference('Requisition.count') do
      post requisitions_url, params: { requisition: { 
          address_years: @requisition.address_years, 
          bank: @requisition.bank, comment: @requisition.comment, 
          company_name: @requisition.company_name, company_phone_number: @requisition.company_phone_number, 
          company_position: @requisition.company_position, company_years: @requisition.company_years, 
          dependents_number: @requisition.dependents_number, has_car: @requisition.has_car, 
          has_imss: @requisition.has_imss, has_sgmm: @requisition.has_sgmm, income: @requisition.income, 
          marital_status: @requisition.marital_status, payment_terms: @requisition.payment_terms, 
          requested_amount: @requisition.requested_amount } }
    end

    assert_redirected_to requisition_url(Requisition.last)
  end

  test "should show requisition" do
    @requisition = requisitions(:one)
    get requisition_url(@requisition)
    assert_response :success
  end

  test "should get edit" do
    @requisition = requisitions(:one)
    get edit_requisition_url(@requisition)
    assert_response :success
  end

  test "should update requisition" do
    @requisition = requisitions(:one)
    patch requisition_url(@requisition), params: { requisition: 
        { address_years: @requisition.address_years, bank: @requisition.bank, comment: @requisition.comment, 
        company_name: @requisition.company_name, company_phone_number: @requisition.company_phone_number, 
        company_position: @requisition.company_position, company_years: @requisition.company_years, 
        dependents_number: @requisition.dependents_number, has_car: @requisition.has_car, 
        has_imss: @requisition.has_imss, has_sgmm: @requisition.has_sgmm, 
        income: @requisition.income, marital_status: @requisition.marital_status, 
        payment_terms: @requisition.payment_terms, requested_amount: @requisition.requested_amount } }
    
    assert_redirected_to requisition_url(@requisition)
  end

end
