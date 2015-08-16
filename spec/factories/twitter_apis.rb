# == Schema Information
#
# Table name: twitter_apis
#
#  id                  :integer          not null, primary key
#  api_key             :string(255)
#  api_secret          :string(255)
#  access_token        :string(255)
#  access_token_secret :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :twitter_api do
    api_key "MyString"
api_secret "MyString"
access_token "MyString"
access_token_secret "MyString"
  end

end
