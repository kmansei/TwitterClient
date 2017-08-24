class TopController < ApplicationController
  before_action :login_required, only: [:timeline]
  require 'twitter'

  def tweet
    client = Twitter::REST::Client.new do |config|
      config.consumer_key         = Settings.twitter.consumer_key
      config.consumer_secret      = Settings.twitter.consumer_secret
      config.access_token         = session[:oauth_token]
      config.access_token_secret  = session[:oauth_token_secret]
    end

    client.update(params[:text])
    redirect_to home_path
  end

  def timeline
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Settings.twitter.consumer_key
      config.consumer_secret = Settings.twitter.consumer_secret
      config.access_token = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]
    end

    @tweets = client.home_timeline(include_entities: true)
    begin
      @profile_banner = client.profile_banner.attrs[:sizes][:web][:url]
    rescue
      @profile_banner = false
    end
  end

end
