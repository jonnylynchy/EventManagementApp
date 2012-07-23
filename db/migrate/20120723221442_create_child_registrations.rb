class CreateChildRegistrations < ActiveRecord::Migration
  def change
    create_table :child_registrations do |t|
      t.integer :child_id
      t.integer :event_id
      t.integer :classroom_id
      t.boolean :is_active
      t.integer :user_transaction_id

      t.timestamps
    end
    add_index :child_registrations, :child_id
    add_index :child_registrations, :event_id
    add_index :child_registrations, :classroom_id
    add_index :child_registrations, :user_transaction_id
  end
end
