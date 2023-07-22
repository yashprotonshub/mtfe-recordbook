class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.float :current_value
      t.float :last_value, default: 0.0
      t.string :diffrence
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
