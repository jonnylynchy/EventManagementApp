class AddFeatureListToSubscriptionTypes < ActiveRecord::Migration
  def change
  	add_column :subscription_types, :feature_list, :text
  end
end
