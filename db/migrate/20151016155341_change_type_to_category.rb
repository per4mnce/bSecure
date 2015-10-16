class ChangeTypeToCategory < ActiveRecord::Migration
  def change
    rename_column :secrets, :type, :category
  end
end
