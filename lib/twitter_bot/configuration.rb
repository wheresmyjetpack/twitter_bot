require 'yaml'
require 'twitter'
require 'news-api'

module TwitterBot
  module Configuration
    QUERY_CONFIG = File.expand_path('./config/query.yml')

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
      config = YAML.load(File.read(QUERY_CONFIG))
      Hash[config['parameters'].map { |k, v| [k.to_sym, v] }]
    end
  end
end
