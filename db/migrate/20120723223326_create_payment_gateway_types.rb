class CreatePaymentGatewayTypes < ActiveRecord::Migration
  def change
    create_table :payment_gateway_types do |t|
      t.string :title
      t.text :description
      t.string :requires

      t.timestamps
    end
  end
end
