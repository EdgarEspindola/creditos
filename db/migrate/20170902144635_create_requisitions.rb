class CreateRequisitions < ActiveRecord::Migration[5.0]
  def change
    create_table :requisitions do |t|
      t.decimal :income, precision: 10, scale: 2
      t.integer :address_years, limit: 8
      t.integer :company_years, limit: 8
      t.string :marital_status
      t.decimal :requested_amount, precision: 10, scale: 2
      t.string :payment_terms
      t.string :bank
      t.string :comment
      t.string :company_name
      t.integer :company_phone_number, limit: 8
      t.integer :dependents_number, limit: 8
      t.string :company_position
      t.boolean :has_sgmm
      t.boolean :has_imss
      t.boolean :has_car
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
