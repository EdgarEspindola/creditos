class PersonalReference < ApplicationRecord
  belongs_to :requisition
  
  validates :first_name, presence: true
  
  validates :first_last_name, presence: true
  
  validates :cell_phone_number, presence: true, length: { is: 10 }
  validates :cell_phone_number, allow_blank: true, numericality: {
    greater_than: 0
  }
  
  validates :requisition, presence: true  
end
