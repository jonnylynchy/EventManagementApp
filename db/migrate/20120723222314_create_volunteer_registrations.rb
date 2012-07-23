class CreateVolunteerRegistrations < ActiveRecord::Migration
  def change
    create_table :volunteer_registrations do |t|
      t.integer :event_id
      t.integer :volunteer_id
      t.integer :classroom_id

      t.timestamps
    end
    add_index :volunteer_registrations, :event_id
    add_index :volunteer_registrations, :volunteer_id
    add_index :volunteer_registrations, :classroom_id
  end
end
