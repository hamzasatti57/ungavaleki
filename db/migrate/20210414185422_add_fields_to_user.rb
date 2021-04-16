class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dob, :date
    add_column :users, :username, :string
    add_column :users, :whatsapp, :boolean, default: false
    add_column :users, :phone, :string
    add_column :users, :bank_name, :string
    add_column :users, :account_type, :string
    add_column :users, :account_number, :string
    add_column :users, :reputation, :decimal, default: "0.0"
    add_column :users, :income, :integer, default: 0
    add_column :users, :slug, :string, default: "blank"
    add_column :users, :status, :string
    add_column :users, :referrer_id, :integer
    add_column :users, :user_type, :string
  end
end
