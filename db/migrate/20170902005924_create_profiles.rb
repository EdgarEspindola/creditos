class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :second_name
      t.string :second_last_name
      t.string :first_last_name, null: false
      t.date :birth_date, null: false
      t.string :curp, null: false
      t.string :rfc, null: false
      t.string :gender
      t.string :birth_state
      t.integer :phone_number, null: false, limit: 8
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
