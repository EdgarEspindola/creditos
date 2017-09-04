json.extract! requisition, :id, :income, :address_years, :company_years, :marital_status, :requested_amount, :payment_terms, :bank, :comment, :company_name, :company_phone_number, :dependents_number, :company_position, :has_sgmm, :has_imss, :has_car, :profile_id, :created_at, :updated_at
json.url requisition_url(requisition, format: :json)
