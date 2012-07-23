class CreateOrganizationDomains < ActiveRecord::Migration
  def change
    create_table :organization_domains do |t|
      t.integer :organization_id
      t.string :domain_name

      t.timestamps
    end
    add_index :organization_domains, :organization_id
  end
end
