class TwitterApisController < ApplicationController
  before_action :set_twitter_api, only: [:show, :edit, :update, :destroy]
  permits :api_key, :api_secret, :access_token, :access_token_secret

  # GET /twitter_apis
  def index
    @twitter_apis = TwitterApi.all
  end

  # GET /twitter_apis/1
  def show
  end

  # GET /twitter_apis/new
  def new
    @twitter_api = TwitterApi.new
  end

  # GET /twitter_apis/1/edit
  def edit
  end

  # POST /twitter_apis
  def create(twitter_api)
    @twitter_api = TwitterApi.new(twitter_api)

    if @twitter_api.save
      redirect_to @twitter_api, notice: 'Twitter api was successfully created.'
    else
      render :new
    end
  end

  # PUT /twitter_apis/1
  def update(twitter_api)
    if @twitter_api.update(twitter_api)
      redirect_to @twitter_api, notice: 'Twitter api was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /twitter_apis/1
  def destroy
    @twitter_api.destroy

    redirect_to twitter_apis_url, notice: 'Twitter api was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter_api(id)
      @twitter_api = TwitterApi.find(id)
    end
end
