require "rails_helper"

describe CardPersister do
  describe "save" do
    let(:member_1)             { double(:member_1) }
    let(:collaberation_1)      { double(:collaberation_1, card: 1, last_activity_date: Date.today, members: [member_1]) }
    let(:collaberation_1_hash) { {card: 1, last_activity_date: Date.today, members: [member_1]} }
    let(:collaberation)        { double(:collaberation, last_activity_date: Date.today) }

    before do
      allow(Collaberation).to receive(:new).and_return(collaberation)
    end

    it "saves new cards" do
      expect(Collaberation).to receive(:new).with(card: 1, last_activity_date: Date.today)
      expect(collaberation).to receive(:members=).with([member_1])
      expect(collaberation).to receive(:save)
      CardPersister.save([collaberation_1_hash])
    end

    it "saves seperate collaberation for changing members on existing card do" do
      pending
    end

    it "saves a collaberation where the same members are on an existing card, if the card has been modified" do
      pending
    end

    it "does nothing when trying to save a collaberation on a card which already exists and has not been modified" do
      allow(Collaberation).to receive(:where).with(card: 1).and_return [collaberation_1]
      expect(Collaberation).not_to receive(:new)
      CardPersister.save([collaberation_1_hash])
    end
  end
end
