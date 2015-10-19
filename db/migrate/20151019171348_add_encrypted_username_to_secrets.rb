class AddEncryptedUsernameToSecrets < ActiveRecord::Migration
  def change
    add_column :secrets, :encrypted_username, :string
  end
end
