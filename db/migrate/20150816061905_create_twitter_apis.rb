class CreateTwitterApis < ActiveRecord::Migration
  def change
    create_table :twitter_apis do |t|
      t.string :api_key
      t.string :api_secret
      t.string :access_token
      t.string :access_token_secret

      t.timestamps null: false
    end
  end
end
