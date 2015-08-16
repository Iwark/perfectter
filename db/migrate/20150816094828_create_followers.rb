class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :account, index: true
      t.string :tid

      t.timestamps null: false

      t.index :tid
    end
    add_foreign_key :followers, :accounts
  end
end
