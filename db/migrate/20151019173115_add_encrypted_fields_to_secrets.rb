class AddEncryptedFieldsToSecrets < ActiveRecord::Migration
  def change
    add_column :secrets, :encrypted_catname, :string
    add_column :secrets, :encrypted_description, :string
    add_column :secrets, :encrypted_pw, :string
    add_column :secrets, :encrypted_url, :string
    add_column :secrets, :encrypted_notes, :string
  end
end
