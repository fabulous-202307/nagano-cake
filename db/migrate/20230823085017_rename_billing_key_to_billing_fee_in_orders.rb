class RenameBillingKeyToBillingFeeInOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :billing_key, :billing_fee
  end
end