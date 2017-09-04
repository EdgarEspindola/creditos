class Requisition < ApplicationRecord
  belongs_to :profile
  has_many :personal_references, dependent: :destroy, inverse_of: :requisition
  accepts_nested_attributes_for :personal_references, allow_destroy: true
  
  enum marital_status_enum: {
    soltero: 'Soltero',
    casado: 'Casado',
    viudo: 'Viudo',
    divorciado: 'Divorciado',
    otros: 'Otros'
  }
  
  validates :income, presence: true
  validates :income, allow_blank: true, numericality: {
    greater_than: 0 }
  
  validates :address_years, presence: true
  validates :address_years, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0 }
  
  validates :company_years, presence: true
  validates :company_years, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0 }
  
  validates :marital_status, presence: true
  validates :marital_status, inclusion: marital_status_enums.values
  
  validates :requested_amount, presence: true
  validates :requested_amount, allow_blank: true, numericality: {
    greater_than: 0 }
  
  validates :payment_terms, presence: true
  
  validates :bank, presence: true
  
  validates :comment, presence: true
  
  validates :company_name, presence: true
  
  validates :company_phone_number, presence: true, length: { minimum: 10 }
  validates :company_phone_number, allow_blank: true, numericality: {
    greater_than: 0 }
  
  validates :dependents_number, presence: true
  validates :dependents_number, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0 }
  
  validates :company_position, presence: true
  
  validates :has_sgmm, inclusion: {
    in: [true, false] }
  
  validates :has_imss, inclusion: {
    in: [true, false] }
  
  validates :has_car, inclusion: {
    in: [true, false] }
  
  validates_associated :personal_references
  
end
