class AddStripeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer_token, :string, null: false, default: ""
  end
end
