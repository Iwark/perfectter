# == Schema Information
#
# Table name: followers
#
#  id         :integer          not null, primary key
#  account_id :integer
#  tid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_followers_on_account_id  (account_id)
#  index_followers_on_tid         (tid)
#

FactoryGirl.define do
  factory :follower do
    account nil
tid "MyString"
  end

end
