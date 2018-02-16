require 'dotenv/load'
require 'news-api'
require 'dogeify'

module TwitterBot
  class Bot
    def initialize(news_api: News.new(ENV['NEWS_API_KEY']), translator: Dogeify.new)
      @news_api = news_api
      @translator = translator
    end

    def tweet
      translate(fetch_originals).sample
    end

    private

    attr_reader :news_api, :translator

    def translate(originals)
      originals.map do |orig|
        translator.process(orig.title) + "\n#{orig.url}"
      end
    end

    def fetch_originals
      news_api.get_top_headlines(**query)
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
