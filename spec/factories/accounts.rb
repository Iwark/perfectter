# == Schema Information
#
# Table name: accounts
#
#  id                           :integer          not null, primary key
#  tid                          :string(255)
#  name                         :string(255)
#  screen_name                  :string(255)
#  description                  :text(65535)
#  description_url              :string(255)
#  is_protected                 :boolean
#  followers_count              :integer
#  friends_count                :integer
#  favourites_count             :integer
#  statuses_count               :integer
#  status                       :text(65535)
#  profile_background_image_url :string(255)
#  profile_image_url            :string(255)
#  profile_use_background_image :boolean
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

FactoryGirl.define do
  factory :account do
    tid 1
name "MyString"
screen_name "MyString"
description "MyText"
description_url "MyString"
protected false
followers_count 1
friends_count 1
favourites_count 1
statuses_count 1
status "MyText"
profile_background_image_url "MyString"
profile_image_url "MyString"
profile_use_background_image false
  end

end
