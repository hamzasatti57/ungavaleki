class AddActualReturnToLoan < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :actual_return, :date
  end
end
