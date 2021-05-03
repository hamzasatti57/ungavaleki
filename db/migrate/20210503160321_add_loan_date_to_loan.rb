class AddLoanDateToLoan < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :loan_date, :date
  end
end
