require 'test_helper'

class RequisitionTest < ActiveSupport::TestCase
  def new_requisition
		Requisition.new(
			income: 9.99,
      address_years: 1,
      company_years: 1,
      marital_status: 'Casado',
      requested_amount: 9.99,
      payment_terms: 'MyString',
      bank: 'MyString',
      comment: 'MyString',
      company_name: 'MyString',
      company_phone_number: 1589641236,
      dependents_number: 1,
      company_position: 'MyString',
      has_sgmm: false,
      has_imss: false,
      has_car: false,
      profile: profiles(:edgar)
		)
  end

  test "company phone number" do
	 ok = [7745698215, 9875607854, 9875693416, 6745690321,  786540987654] 
	 bad = [65489673, "my phone number", -5679834520, "4567abc7895"]
	
	 ok.each do |phone_number|
	 	requisition = new_requisition
    requisition.company_phone_number = phone_number        
    assert requisition.valid?, "#{phone_number} shouldn't be invalid"
	 end
	
	 bad.each do |phone_number|
     requisition = new_requisition
     requisition.company_phone_number = phone_number
	 	 assert requisition.invalid?, "#{phone_number} shouldn't be valid"
   end
  end

  test "requisition attributes must not be empty" do
    requisition = Requisition.new
    assert requisition.invalid?
    assert requisition.errors[:income].any?	
    assert requisition.errors[:address_years].any?
    assert requisition.errors[:company_years].any?
    assert requisition.errors[:marital_status].any?
    assert requisition.errors[:requested_amount].any?
    assert requisition.errors[:payment_terms].any?
    assert requisition.errors[:bank].any?
    assert requisition.errors[:comment].any?
    assert requisition.errors[:company_name].any?
    assert requisition.errors[:company_phone_number].any?
    assert requisition.errors[:dependents_number].any?
    assert requisition.errors[:company_position].any?
    assert requisition.errors[:has_sgmm].any?
    assert requisition.errors[:has_imss].any?
    assert requisition.errors[:has_car].any?
  end
  
 
  test "marital status" do
    ok = Requisition.marital_status_enums.values
    bad = [65489673, "my marital status", 'Another status', "???????"]
	
	 ok.each do |marital_status|
	 	requisition = new_requisition
    requisition.marital_status = marital_status    
    assert requisition.valid?, "#{marital_status} shouldn't be invalid"
	 end
	
	 bad.each do |marital_status|
     requisition = new_requisition
     requisition.marital_status = marital_status
	 	 assert requisition.invalid?, "#{marital_status} shouldn't be valid"
   end
  end
end
