class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :tid
      t.string :name
      t.string :screen_name
      t.text :description
      t.string :description_url
      t.boolean :is_protected
      t.integer :followers_count
      t.integer :friends_count
      t.integer :favourites_count
      t.integer :statuses_count
      t.text :status
      t.string :profile_background_image_url
      t.string :profile_image_url
      t.boolean :profile_use_background_image

      t.timestamps null: false
    end
  end
end
