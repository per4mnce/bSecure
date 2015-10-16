class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.string :type
      t.string :description
      t.string :username
      t.string :password
      t.string :url
      t.string :notes

      t.timestamps null: false
    end
  end
end
