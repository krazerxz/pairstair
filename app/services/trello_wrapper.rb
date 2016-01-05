class TrelloWrapper
  include TrelloHelper

  def self.current_collaberations
    dev_cards_with_faces.each do|card| card[:card] = card.delete(:id) end
    dev_cards_with_faces.each {|card| card[:members] = card.delete(:member_ids) }
  end

  def self.main_board
    TrelloHelper.member.boards.find {|board| board.id == ENV["trello_main_board_id"] }
  end

  def self.dev_list
    main_board.lists.find {|list| list.id == ENV["trello_dev_list_id"] }
  end

  def self.dev_cards
    dev_list.cards.map {|card| card.serializable_hash.extract!(:id, :last_activity_date, :member_ids) }
  end

  def self.dev_cards_with_faces
    @cards ||= dev_cards.reject {|card| card[:member_ids].empty? }
  end

  private_class_method :main_board, :dev_list, :dev_cards, :dev_cards_with_faces
end
