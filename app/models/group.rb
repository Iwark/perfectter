# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  add_count  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  has_many :accounts, dependent: :destroy

  def create_candidates(n=1)
    account_ids = self.accounts.ids
    tids = (Follower.
      where(account_id: account_ids).
      group(:tid).
      count.
      sort{|(k1,v1),(k2,v2)| v2 <=> v1}.
      map{|a| a[0]} - Account.pluck(:tid)).
      take(n)
    accounts = []
    tids.each do |tid|
      accounts << self.accounts.new(tid: tid)
    end
    Account.import accounts
  end

end
