class ChangePasswordToPw < ActiveRecord::Migration
  def change
        rename_column :secrets, :password, :pw
  end
end
