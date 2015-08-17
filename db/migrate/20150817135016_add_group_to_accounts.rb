class AddGroupToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :group, index: true
    add_foreign_key :accounts, :groups
  end
end
