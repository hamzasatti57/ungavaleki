class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.float :amount, default: 0.0
      t.float :revenue, default: 0.0
      t.float :why_not, default: 0.0
      t.float :nonsense, default: 0.0
      t.float :operation, default: 0.0
      t.float :plug, default: 0.0
      t.float :time_stamp, default: 0.0

      t.timestamps
    end
  end
end
