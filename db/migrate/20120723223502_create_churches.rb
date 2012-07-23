class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :title
      t.text :description
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end
