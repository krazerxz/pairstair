#!/usr/bin/env ruby

require "byebug"
require "trello"

ACCESS_MEMBER = "chrispomfret".freeze
ORG_ID        = "559a469f07b1a13dcbc32258".freeze
MAIN_BOARD_ID = "559a4ecf3f95ecde0fc1d2e5".freeze
DEV_LIST_ID   = "559a5a00d95959bd388b967d".freeze

Trello.configure do |config|
  config.developer_public_key = "c918168bb3da1a1f727f4a595328fc85"
  config.member_token = "b69fe5e3b797a5d4551b81d90ca8e93baa19f98d733298d19d2a644be85937da"
end

member = Trello::Member.find(ACCESS_MEMBER)

main_board = member.boards.find {|board| board.id == MAIN_BOARD_ID }
dev_list   = main_board.lists.find {|list| list.id == DEV_LIST_ID }
dev_cards  = dev_list.cards.map {|card| card.serializable_hash.extract!(:id, :last_activity_date, :member_ids) }
dev_cards_with_faces = dev_cards.reject {|card| card[:member_ids].empty? }
# change :id to :card
puts dev_cards_with_faces

# MSB Members
member_hash = {}
members = Trello::Organization.find(ORG_ID).members
members.map do |team_member| member_hash[team_member.id] = team_member.full_name end

puts member_hash
