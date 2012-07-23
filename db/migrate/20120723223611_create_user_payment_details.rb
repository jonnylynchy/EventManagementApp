class CreateUserPaymentDetails < ActiveRecord::Migration
  def change
    create_table :user_payment_details do |t|
      t.integer :user_id
      t.string :payment_type
      t.string :hashed_cc_number
      t.string :salt
      t.string :cvv

      t.timestamps
    end
    add_index :user_payment_details, :user_id
  end
end
