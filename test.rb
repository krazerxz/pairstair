#!/usr/bin/env ruby
#
require 'byebug'
require 'trello'

Trello.configure do |config|
  config.developer_public_key = 'c918168bb3da1a1f727f4a595328fc85'
  config.member_token = 'b69fe5e3b797a5d4551b81d90ca8e93baa19f98d733298d19d2a644be85937da'
end

ACCESS_MEMBER = 'chrispomfret'

member = Trello::Member.find(ACCESS_MEMBER)

debugger

puts 'end'
