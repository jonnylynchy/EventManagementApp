class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.integer :organization_id

      t.timestamps
    end

    add_index :admin_users, :organization_id
  end
end
