class CreatePlugUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :plug_users do |t|
      t.integer :user_id
      t.integer :child_id

      t.timestamps
    end
  end
end
