require 'dogeify'
require 'date'

require_relative './configuration'

module TwitterBot
  class Bot
    include Configuration

    def initialize(translator: Dogeify.new)
      @translator = translator
    end

    def tweet
      translate(fetch_original).tap do |tweet|
        client.update(tweet)
      end
    end

    private

    attr_reader :translator

    def fetch_original
      get_latest(news_client.get_top_headlines(**query)).first
    end

    def get_latest(articles)
      articles.sort { |a,b| Date.parse(a.publishedAt) <=> Date.parse(b.publishedAt) }
    end

    def translate(orig)
      translator.process(orig.title) + "\n#{orig.url}"
    end
  end
end
