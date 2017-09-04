require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def new_user
		User.new(
			name: 'edgar',
      email: 'edgar@gmail.com',      
		)
  end
  
  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?	
    assert user.errors[:email].any?
    assert user.errors[:password].any?
    assert user.errors[:password_confirmation].any?    
  end
  
  test "unique users" do
    user = new_user
    
    assert user.invalid?      
    assert_equal ['ya existe'], user.errors[:name]
  end
end
