class FixDescriptionColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :description, :description1
  end
end
