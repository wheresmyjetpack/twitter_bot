require 'dogeify'

require_relative './configuration'

module TwitterBot
  class Bot
    include Configuration

    def initialize(translator: Dogeify.new)
      @translator = translator
    end

    def tweet
      translate(fetch_originals).sample.tap do |tweet|
        client.update(tweet)
      end
    end

    private

    attr_reader :translator

    def translate(originals)
      originals.map do |orig|
        translator.process(orig.title) + "\n#{orig.url}"
      end
    end

    def fetch_originals
      news_client.get_top_headlines(**query)
    end
  end
end
