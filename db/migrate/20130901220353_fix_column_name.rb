class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :ball_tables, :type, :table_type
  end
end