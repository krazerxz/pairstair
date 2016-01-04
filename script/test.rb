#!/usr/bin/env ruby

require "byebug"
require "trello"

ACCESS_MEMBER = "chrispomfret"
ORG_ID        = "559a469f07b1a13dcbc32258"
MAIN_BOARD_ID = "559a4ecf3f95ecde0fc1d2e5"
DEV_LIST_ID   = "559a5a00d95959bd388b967d"

Trello.configure do |config|
  config.developer_public_key = "c918168bb3da1a1f727f4a595328fc85"
  config.member_token = "b69fe5e3b797a5d4551b81d90ca8e93baa19f98d733298d19d2a644be85937da"
end

member = Trello::Member.find(ACCESS_MEMBER)

main_board = member.boards.select{|board| board.id == MAIN_BOARD_ID }.first
dev_list   = main_board.lists.select{|list| list.id == DEV_LIST_ID }.first
dev_cards  = dev_list.cards.map{|card| card.serializable_hash.extract!(:id, :last_activity_date, :member_ids) }
dev_cards_with_faces = dev_cards.reject{|card| card[:member_ids].empty? }

# MSB Members
member_hash = Hash.new
members = Trello::Organization.find(ORG_ID).members
members.map{ |member| member_hash[member.id] = member.full_name }




debugger

puts "end"
