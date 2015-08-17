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

class Account < ActiveRecord::Base

  belongs_to :group
  has_many :friends, dependent: :delete_all
  has_many :followers, dependent: :delete_all

  validates :group_id, presence: true

  before_create :fetch_account_data
  after_create :fetch_friends_data
  after_create :fetch_followers_data

  def fetch_account_data
    api = TwitterApi.all.sample
    if user = api.get_user(self.screen_name || self.tid.to_i)
      if user.to_h[:protected] == true
        errors.add :screen_name, :is_protected
      else
        self.tid                          = user.to_h[:id]
        self.screen_name                  = user.to_h[:screen_name]
        self.name                         = delete_4byte_chars(user.to_h[:name])
        self.description                  = delete_4byte_chars(user.to_h[:description])
        urls                              = user.to_h[:entities].to_h[:description].to_h[:urls].to_a
        self.description_url              = urls[0][:expanded_url] if urls.length > 0
        self.is_protected                 = user.to_h[:protected]
        self.followers_count              = user.to_h[:followers_count]
        self.friends_count                = user.to_h[:friends_count]
        self.favourites_count             = user.to_h[:favourites_count]
        self.statuses_count               = user.to_h[:statuses_count]
        self.status                       = delete_4byte_chars(user.to_h[:status].to_json)
        self.profile_background_image_url = user.to_h[:profile_background_image_url]
        self.profile_image_url            = user.to_h[:profile_image_url]
        self.profile_use_background_image = user.to_h[:profile_use_background_image]
      end
    else
      errors.add :screen_name, :could_not_fetch_account_data
    end
    errors.add :tid, :not_found if !self.tid || !self.screen_name
  end

  def fetch_friends_data
    api = TwitterApi.all.sample
    if friend_ids = api.get_friend_ids(self.screen_name)
      friends_data = []
      friend_ids.each do |friend_id|
        friends_data << Friend.new(account_id: self.id, tid: friend_id)
      end
      Friend.import friends_data
    end
  end

  def fetch_followers_data
    api = TwitterApi.all.sample
    if follower_ids = api.get_follower_ids(self.screen_name)
      followers_data = []
      follower_ids.each do |follower_id|
        followers_data << Friend.new(account_id: self.id, tid: follower_id)
      end
      Follower.import followers_data
    end
  end

  def delete_4byte_chars(str)
    str ? str.each_char.select{|c| c.bytes.count < 4 }.join('') : ""
  end

end
