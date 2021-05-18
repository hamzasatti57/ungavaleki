class AddFieldToLoan < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :expected_return, :string
    add_column :loans, :expected_amount, :float
  end
end
