class CreateChildAllergies < ActiveRecord::Migration
  def change
    create_table :child_allergies do |t|
      t.integer :child_id
      t.integer :allergy_id

      t.timestamps
    end
    add_index :child_allergies, :child_id
    add_index :child_allergies, :allergy_id
  end
end
