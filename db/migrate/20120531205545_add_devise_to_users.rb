class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.string :encrypted_password, :null => false, :default => ""
    end

    add_index :users, :email,                :unique => true
  end

  def self.down
  end
end
