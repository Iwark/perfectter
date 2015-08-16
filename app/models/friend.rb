# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  account_id :integer
#  tid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_friends_on_account_id  (account_id)
#  index_friends_on_tid         (tid)
#

class Friend < ActiveRecord::Base
  belongs_to :account

  def self.pickup_candidates(n=10)
    (group(:tid).
    count.
    sort{|(k1,v1),(k2,v2)| v2 <=> v1}.
    map{|a| a[0]} - Account.pluck(:tid)).
    take(n)
  end
end
