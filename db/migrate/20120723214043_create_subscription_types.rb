class CreateSubscriptionTypes < ActiveRecord::Migration
  def change
    create_table :subscription_types do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
