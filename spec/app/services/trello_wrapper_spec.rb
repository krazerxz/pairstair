require "rails_helper"

describe TrelloWrapper do
  describe "current_collaberations" do
    let(:member_1)              { double(:member_1) }
    let(:member_2)              { double(:member_2) }
    let(:members)               { [member_1, member_2] }
    let(:card_hash)             { {id: "random_card", last_activity_date: Date.today, member_ids: []} }
    let(:card_with_faces_hash)  { {id: "facess_card", last_activity_date: Date.today, member_ids: members, random_key: "value"} }
    let(:card_with_face_hash)   { {id: "face_card", last_activity_date: Date.today, member_ids: [member_1], random_key: "value"} }

    let(:card)                  { double(:card, serializable_hash: card_hash) }
    let(:card_with_faces)       { double(:card_with_faces, serializable_hash: card_with_faces_hash) }
    let(:card_with_face)        { double(:card_with_face, serializable_hash: card_with_face_hash) }

    let(:another_list)  { {id: "another_list"} }
    let(:dev_list)      { double(:dev_list, id: "dev_list_id", cards: [card, card_with_faces, card_with_face]) }

    let(:another_board) { double(:another_board, id: "another_board") }
    let(:main_board)    { double(:main_board, id: "559a4ecf3f95ecde0fc1d2e5", lists: [dev_list, another_list]) }

    let(:boards)        { [another_board, main_board] }
    let(:member)        { double(:member) }

    it "retrieves cards with faces from the dev trello list" do
      allow(TrelloHelper).to receive(:member).and_return(member)
      allow(member).to receive(:boards).and_return(boards)
      expect(TrelloWrapper.current_collaberations).to match([card: "facess_card", last_activity_date: Date.today, members: members])
    end
  end

  describe "organization_members" do
    let(:organization_members) { [double(:member_1, id: 1, full_name: "chris"), double(:member_2, id: 2, full_name: "james")] }

    it "returns all members in the organization" do
      allow(TrelloHelper).to receive(:organization_members).and_return(organization_members)
      expect(TrelloWrapper.organization_members).to eq(organization_members)
    end
  end
end
