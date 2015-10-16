class ChangeCategoryToCatname < ActiveRecord::Migration
  def change
    rename_column :secrets, :category, :catname
  end
end
