#!/usr/bin/env ruby

require 'twitter'
require_relative '../lib/twitter_bot'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV.fetch('CONSUMER_KEY')
  config.consumer_secret = ENV.fetch('CONSUMER_SECRET')
  config.access_token = ENV.fetch('ACCESS_TOKEN')
  config.access_token_secret = ENV.fetch('ACCESS_TOKEN_SECRET')
end

bot = TwitterBot::Bot.new
client.update(bot.tweet)
