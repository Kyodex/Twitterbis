require 'twitter'
require 'dotenv'
class SendTweet

  def initialize(message)
  @message =  message
  end

  def perform
    login_in_to_twitter
    send_tweet
  end

  def login_in_to_twitter
    Dotenv.load
  @client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['twitter_key']
  config.consumer_secret     = ENV['twitter_secret']
  config.access_token        = ENV['twitter_token']
  config.access_token_secret = ENV['twitter_token_secret']
    end
  end

  def send_tweet
      @client.update(@message)
  end

end
