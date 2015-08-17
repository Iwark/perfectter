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
#  group_id                     :integer
#
# Indexes
#
#  index_accounts_on_group_id  (group_id)
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
