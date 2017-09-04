require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = Profile.new(
      first_name: 'Pedro',
      second_name: 'Santiago',
      second_last_name: 'Martinez',
      first_last_name: 'Mendoza',
      birth_date: '1985-09-01'.to_date,
      curp: 'ROMJ910508HDGJNS01', 
      rfc: 'ROAA6411012FA',
      gender: 'Masculino',
      birth_state: 'San Pedro Nopala',
      phone_number: 9658741237
    )
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: 
          { birth_date: @profile.birth_date, birth_state: @profile.birth_state, 
          curp: @profile.curp, first_last_name: @profile.first_last_name, 
          first_name: @profile.first_name, gender: @profile.gender, 
          phone_number: @profile.phone_number, 
          rfc: @profile.rfc, second_last_name: @profile.second_last_name, 
          second_name: @profile.second_name } 
      }
    end

    assert_redirected_to requisitions_url
  end

  test "should show profile" do
    get profile_url(profiles(:edgar))
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(profiles(:edgar))
    assert_response :success
  end

  test "should update profile" do
    @profile = profiles(:edgar)
    patch profile_url(@profile), params: { profile: 
        { birth_date: @profile.birth_date, birth_state: @profile.birth_state, 
        curp: @profile.curp, first_last_name: @profile.first_last_name, 
        first_name: @profile.first_name, gender: @profile.gender, 
        phone_number: @profile.phone_number, rfc: @profile.rfc, 
        second_last_name: @profile.second_last_name, second_name: @profile.second_name } 
    }
    assert_redirected_to @profile
  end

end
