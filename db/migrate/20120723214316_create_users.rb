class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.integer :organization_id
      t.string :home_phone
      t.string :mobile_phone
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postal_code
      t.integer :church_id

      t.timestamps
    end

    add_index :users, :organization_id
  end
end
