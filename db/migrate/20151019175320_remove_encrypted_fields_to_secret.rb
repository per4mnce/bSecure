class RemoveEncryptedFieldsToSecret < ActiveRecord::Migration
  def change
    remove_column :secrets, :encrypted_description, :string
    remove_column :secrets, :encrypted_catname, :string
  end
end
