class TweetWorker
  include Sidekiq::Worker

  def perform(current_user_id, tweet)
    current_user = User.find(current_user_id)
    make_the_tweet(current_user, tweet)

    # set up Twitter OAuth client here
    # actually make API call
    # Note: this does not have access to controller/view helpers
    # You'll have to re-initialize everything inside here
  end


  def make_the_tweet(user, tweet)
    client = buildTweeterFor(user)
    client.update(tweet)
  end


  def buildTweeterFor(user)
    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.oauth_token = user.oauth_token #ENV['OAUTH_TOKEN']
      config.oauth_token_secret = user.oauth_secret #ENV['OAUTH_TOKEN_SECRET']
    end
  end

  def current_user
    User.find(session[:user_id])
  end

end
