class TweetsController < ApplicationController
  def new
  end

  def create
  	current_user.tweet(twitter_params[:message])
  end

  def index
  	load_tweets
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end

  def load_tweets
  	client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = '1230349076-XpBaQKfNUSLI7NhcHCheyYhnHTuEuKpzHk2tnbH'
      config.access_token_secret = 'YRQ34dFhxwIWNavg6SyeagmZeoWzl4Toqcimdj4KjQizA'

    end
    @tweets = client.user_timeline[0..4] # For this demonstration lets keep the tweets limited to the first 5 available.
  end
  
end
