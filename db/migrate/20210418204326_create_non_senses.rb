class CreateNonSenses < ActiveRecord::Migration[5.2]
  def change
    create_table :non_senses do |t|
      t.string :name
      t.float :amount, default: 0.0

      t.timestamps
    end
  end
end
