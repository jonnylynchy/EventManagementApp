class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :grade_completed
      t.date :dob
      t.text :special_needs

      t.timestamps
    end

    add_index :children, :user_id
  end
end
