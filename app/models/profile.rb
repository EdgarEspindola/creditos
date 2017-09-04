class Profile < ApplicationRecord
  belongs_to :user
  has_many :requisitions
  
  enum genders: {
    masculino: 'Masculino',
    femenino: 'Femenino'
  }
  
  validates :first_name, presence: true
  validates :first_name, uniqueness: {
    scope: [:first_last_name, :birth_date], 
    case_sensitive: false }
  
  validates :first_last_name, presence: true
  
  validates :second_last_name, presence: true
  
  validates :birth_date, presence: true
  
  validates :gender, presence: true
  validates :gender, allow_blank: true, inclusion: genders.values
  
  validates :birth_state, presence: true
  
  validates :phone_number, presence: true, length: { minimum: 10 }
  validates :phone_number, allow_blank: true, numericality: { greater_than: 0 }
  
  validates :rfc, presence: true, uniqueness: true  
  validates :rfc, allow_blank: true, format: {
    with: /[A-Z]{3}+[0-9]{6}+[0-9A-Z]{3}?\Z/ }
  
  validates :curp, presence: true, uniqueness: true
  validates :curp, allow_blank: true, format: {
    with: /\A[A-Z][AEIOUX][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][MH][A-Z][BCDFGHJKLMNÑPQRSTVWXYZ]{4}[0-9A-Z][0-9]\z/ }
end
