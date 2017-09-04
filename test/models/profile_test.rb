require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  def new_profile
		Profile.new(
			first_name: 'MyString',
			second_name: 'MyString',
   		second_last_name: 'MyString',
   		first_last_name: 'MyString',
   		birth_date: Date.new,
   		curp: 'AIRO571121HOCSDD00',
   		rfc: 'AIRO5711212ZA',
   		gender: Profile.genders[:masculino],
   		birth_state: 'MyString',
   		phone_number: 9589631452,
      user: users(:one)
		)
  end

  test "phone number" do
	 ok = [7745698215, 9875607854, 9875693416, 6745690321,  786540987654] 
	 bad = [65489673, "my phone number", -5679834520, "4567abc7895"]
	
	 ok.each do |phone_number|
	 	profile = new_profile
    profile.phone_number = phone_number    
    assert profile.valid?, "#{phone_number} shouldn't be invalid"
	 end
	
	 bad.each do |phone_number|
     profile = new_profile
     profile.phone_number = phone_number
	 	 assert profile.invalid?, "#{phone_number} shouldn't be valid"
   end
  end

  test "profile attributes must not be empty" do
    profile = Profile.new
    assert profile.invalid?
    assert profile.errors[:first_name].any?	
    assert profile.errors[:first_last_name].any?
    assert profile.errors[:second_last_name].any?
    assert profile.errors[:birth_date].any?
    assert profile.errors[:gender].any?
    assert profile.errors[:birth_state].any?
    assert profile.errors[:phone_number].any?
    assert profile.errors[:curp].any?
    assert profile.errors[:rfc].any?
  end
  
  test "curp" do
	 ok = ['AECJ940429HCHRRS01', 'AIHP911101MCHRRR03', 'BAVC840614HCHRLR04'] 
	 bad = ['AECJ940429HCHRRS014', 'AIHP911101MCHRR3', 'B3VC840614HCHRLR04']
	
	 ok.each do |curp|
	 	profile = new_profile
    profile.curp = curp
    assert profile.valid?, "#{curp} shouldn't be invalid"
	 end
	
	 bad.each do |curp|
     profile = new_profile
     profile.curp = curp
	 	 assert profile.invalid?, "#{curp} shouldn't be valid"
   end
  end
  
  test "rfc" do
	 ok = ['CUPU800825569', 'PEGA241023IE3', 'LIEA6501297U7'] 
	 bad = ['HECC6502205H88', "my rfc", -5679834520, 'CVI-910218-N51']
	
	 ok.each do |rfc|
	 	profile = new_profile
    profile.rfc = rfc
    assert profile.valid?, "#{rfc} shouldn't be invalid"
	 end
	
	 bad.each do |rfc|
     profile = new_profile
     profile.rfc = rfc
	 	 assert profile.invalid?, "#{rfc} shouldn't be valid"
   end
  end
  
  test "unique profiles" do
    profile = profiles(:edgar)
    
    another_profile = new_profile
    another_profile.birth_date = profile.birth_date
    assert another_profile.invalid?  
    
    assert_equal ['ya existe'],
      another_profile.errors[:first_name]
  end
end
