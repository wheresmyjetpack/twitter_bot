require 'twitter'
require 'news-api'

module TwitterBot
  module Configuration
   def client
     Twitter::REST::Client.new do |config|
        config.consumer_key = ENV.fetch('CONSUMER_KEY')
        config.consumer_secret = ENV.fetch('CONSUMER_SECRET')
        config.access_token = ENV.fetch('ACCESS_TOKEN')
        config.access_token_secret = ENV.fetch('ACCESS_TOKEN_SECRET')
      end
    end

    def news_client
      News.new(ENV['NEWS_API_KEY'])
    end

    def query
      {
        q: 'trump',
        language: 'en',
        country: 'us'
      }
    end
  end
end
