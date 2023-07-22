class AddCommisionToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :added_commision, :float, default: 0.0
    add_column :records, :total_commision, :float, default: 0.0
    add_column :records, :grand_total_without_commision, :float, default: 0.0
    add_column :records, :grand_total, :float, default: 0.0
  end
end
