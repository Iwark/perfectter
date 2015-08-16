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

class TwitterApi < ActiveRecord::Base

  #################
  #
  #    API操作
  #
  #################

  # クライアントの取得
  #
  # @return [Twitter::REST::Client] client Twitterクライアント
  def client
    @client ||=
    Twitter::REST::Client.new(
      consumer_key:       self.api_key,
      consumer_secret:    self.api_secret,
      # access_token:        self.access_token,
      # access_token_secret: self.access_token_secret
      )
  end

  # ユーザーの取得
  #
  # @param [String] target ターゲットアカウントのscreen_name
  # @return [Twitter::User] user Twitterユーザー情報.
  def get_user(target=screen_name)
    begin
      user = client.user(target)
    rescue => e
      error_log(e)
    end
    user
  end

  # 複数のユーザーの取得
  #
  # @param [Array<String>] targets ターゲットアカウントのscreen_name
  # @return [Array<Twitter::User>] users Twitterユーザーリスト情報.
  def get_users(targets)
    begin
      users = client.users(targets)
    rescue => e
      error_log(e)
    end
    users
  end

  # フレンド(フォロー)ID一覧の取得
  #
  # @param [String] target ターゲットアカウントのscreen_name
  # @return [Array<Fixnum>] friend_ids フレンドIDの配列
  def get_friend_ids(target=screen_name)
    begin
      friend_ids = client.friend_ids(target).to_a
    rescue => e
      error_log(e)
    end
    friend_ids
  end

  # フォロワーID一覧の取得
  #
  # @param [String] target ターゲットアカウントのscreen_name
  # @return [Array<Fixnum>] follower_ids フォロワーIDの配列
  def get_follower_ids(target=screen_name)
    begin
      follower_ids = client.follower_ids(target).to_a
    rescue => e
      error_log(e)
    end
    follower_ids
  end

  #################
  #
  #    ログ出力
  #
  #################

  # ログの出力
  #
  # @param [String] contents ログ内容
  # @return [nil]
  def info_log(contents)
    now = DateTime.now.strftime("%m/%d %H:%M")
    method = caller[0][/`([^']*)'/, 1]
    puts "[Info] #{now} #{method} #{contents}"
  end

  # エラーログの出力
  #
  # @param [String] contents エラー内容
  # @return [nil]
  def error_log(contents)
    now = DateTime.now.strftime("%m/%d %H:%M")
    method = caller[0][/`([^']*)'/, 1]
    $stderr.puts "[Error] #{now} #{method} #{contents}"
  end

end
