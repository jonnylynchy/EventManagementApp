class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :organization_id
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
    add_index :volunteers, :organization_id
  end
end
