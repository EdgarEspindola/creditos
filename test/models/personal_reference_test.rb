require 'test_helper'

class PersonalReferenceTest < ActiveSupport::TestCase
  def new_personal_reference
		PersonalReference.new(
			first_name: 'MyString',			
   		first_last_name: 'MyString',
   		cell_phone_number: 9589631452,
      requisition: requisitions(:one)
		)
  end

  test "cell phone number" do
	 ok = [7745698215, 9875607854, 9875693416, 6745690321, 7865409876] 
	 bad = [65489673, "my phone number", -5679834520, "4567abc7895"]
	
	 ok.each do |cell_phone_number|
	 	personal_reference = new_personal_reference
    personal_reference.cell_phone_number = cell_phone_number
    assert personal_reference.valid?, "#{cell_phone_number} shouldn't be invalid"
	 end
	
	 bad.each do |cell_phone_number|
     personal_reference = new_personal_reference
     personal_reference.cell_phone_number = cell_phone_number
	 	 assert personal_reference.invalid?, "#{cell_phone_number} shouldn't be valid"
   end
  end

  test "personal_reference attributes must not be empty" do
    personal_reference = PersonalReference.new
    assert personal_reference.invalid?
    assert personal_reference.errors[:first_name].any?	
    assert personal_reference.errors[:first_last_name].any?
    assert personal_reference.errors[:cell_phone_number].any?
    assert personal_reference.errors[:requisition].any?    
  end
  
end
