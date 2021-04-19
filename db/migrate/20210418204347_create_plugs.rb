class CreatePlugs < ActiveRecord::Migration[5.2]
  def change
    create_table :plugs do |t|
      t.string :name
      t.float :amount, default: 0.0

      t.timestamps
    end
  end
end
