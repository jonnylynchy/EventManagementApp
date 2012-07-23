class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :title
      t.text :description
      t.integer :organization_id

      t.timestamps
    end
    add_index :classrooms, :organization_id
  end
end
