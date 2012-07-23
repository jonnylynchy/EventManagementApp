class CreateOrganizationPaymentDetails < ActiveRecord::Migration
  def change
    create_table :organization_payment_details do |t|
      t.integer :organization_id
      t.string :payment_type
      t.string :hashed_cc_number
      t.string :salt
      t.string :cvv

      t.timestamps
    end
    add_index :organization_payment_details, :organization_id
  end
end
