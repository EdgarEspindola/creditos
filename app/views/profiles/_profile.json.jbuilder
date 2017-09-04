json.extract! profile, :id, :first_name, :second_name, :second_last_name, :first_last_name, :birth_date, :curp, :rfc, :gender, :birth_state, :phone_number, :created_at, :updated_at
json.url profile_url(profile, format: :json)
