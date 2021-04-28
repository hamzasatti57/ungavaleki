class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.text :description
      t.float :amount
      t.boolean :admin_approval, default: false
      t.boolean :plug_approval, default: false
      t.string :status, default: 'pending'
      t.date :due_date
      t.integer :user_id

      t.timestamps
    end
  end
end
