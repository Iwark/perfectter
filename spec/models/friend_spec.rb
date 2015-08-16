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

require 'rails_helper'

RSpec.describe Friend, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
