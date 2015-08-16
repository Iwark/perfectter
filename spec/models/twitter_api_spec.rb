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

require 'rails_helper'

RSpec.describe TwitterApi, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
