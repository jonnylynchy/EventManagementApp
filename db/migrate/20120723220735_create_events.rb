class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :organization_id
      t.string :title
      t.text :description
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.integer :maximum_registrations

      t.timestamps
    end
    add_index :events, :organization_id
  end
end
