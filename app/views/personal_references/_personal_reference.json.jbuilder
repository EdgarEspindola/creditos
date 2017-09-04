json.extract! personal_reference, :id, :first_name, :second_name, :first_last_name, :second_last_name, :cell_phone_number, :requisition_id, :created_at, :updated_at
json.url personal_reference_url(personal_reference, format: :json)
