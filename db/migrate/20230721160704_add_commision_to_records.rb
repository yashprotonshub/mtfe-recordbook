class AddCommisionToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :added_commision, :float
    add_column :records, :total_commision, :float
    add_column :records, :grand_total , :float
  end
end
