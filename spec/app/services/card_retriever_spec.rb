require "rails_helper"

describe CardRetriever do
  describe "update" do
    let(:collaberation_1) { Collaberation.new(id: "1", last_activity_date: Date.today) }
    let(:collaberation_2) { Collaberation.new(id: "2", last_activity_date: Date.today) }
    let(:collaberations) { [collaberation_1, collaberation_2] }

    before do
      allow(TrelloWrapper).to receive(:current_collaberations).and_return(collaberations)
      allow(CardPersister).to receive(:save).with(collaberations)
    end

    it "fetches all cards from trello" do
      expect(TrelloWrapper).to receive(:current_collaberations)
      CardRetriever.update
    end

    it "saves the cards" do
      expect(CardPersister).to receive(:save).with(collaberations)
      CardRetriever.update
    end
  end
end
