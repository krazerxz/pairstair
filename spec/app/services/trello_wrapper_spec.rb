require "rails_helper"

describe TrelloWrapper do
  describe "current_collaberations" do
    let(:member_1)              { double(:member_1) }
    let(:member_2)              { double(:member_2) }
    let(:members)               { [member_1, member_2] }
    let(:card_hash)             { {id: "random_card", last_activity_date: Date.today, members: []} }
    let(:card_with_faces_hash)  { {id: "facess_card", last_activity_date: Date.today, members: members, random_key: "value"} }

    let(:card)                  { double(:card, serializable_hash: card_hash) }
    let(:card_with_faces)       { double(:card_with_faces, serializable_hash: card_with_faces_hash) }

    let(:another_list)  { {id: "another_list"} }
    let(:dev_list)      { double(:dev_list, id: "dev_list_id", cards: [card, card_with_faces]) }

    let(:another_board) { double(:another_board, id: "another_board") }
    let(:main_board)    { double(:main_board, id: "main_board_id", lists: [dev_list, another_list]) }

    let(:boards)        { [another_board, main_board] }
    let(:member)        { double(:member) }

    it "retrieves cards with faces from the dev trello list" do
      allow(TrelloHelper).to receive(:member).and_return(member)
      allow(member).to receive(:boards).and_return(boards)
      expect(TrelloWrapper.current_collaberations).to match([card: "facess_card", last_activity_date: Date.today, members: members])
    end
  end
end
