class AddFieldsToLoan < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :admin_pay, :boolean, default: false
    add_column :loans, :user_pay, :boolean, default: false
    add_column :loans, :admin_received, :boolean, default: false
  end
end
