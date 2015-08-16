class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :account, index: true
      t.string :tid

      t.timestamps null: false

      t.index :tid
    end
    add_foreign_key :friends, :accounts
  end
end
