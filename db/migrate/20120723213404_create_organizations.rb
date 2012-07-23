class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :title
      t.string :contact_phone
      t.string :contact_email
      t.text :description
      t.string :subdomain

      t.timestamps
    end
  end
end
