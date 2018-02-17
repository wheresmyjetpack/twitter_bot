#!/usr/bin/env ruby

require 'dotenv/load'
require_relative '../lib/twitter_bot'

bot = TwitterBot::Bot.new
bot.tweet
