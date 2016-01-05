require "rails_helper"

describe CardPersister do
  describe "save" do
    let(:member_1)             { double(:member_1) }
    let(:collaberation_1)      { double(:collaberation_1, card: 1, last_activity_date: Time.now, members: [member_1]) }
    let(:collaberation_1_hash) { {card: 1, last_activity_date: Time.now, members: [member_1]} }
    let(:collaberation_persister) { double(:collaberation, last_activity_date: Time.now) }

    before do
      allow(CollaberationPersister).to receive(:new).and_return(collaberation_persister)
    end

    it "saves new cards" do
      expect(CollaberationPersister).to receive(:new).with(collaberation_1_hash)
      expect(collaberation_persister).to receive(:persist)
      CardPersister.save([collaberation_1_hash])
    end

    xit "saves seperate collaberation for changing members on existing card do" do
    end

    xit "saves a collaberation where the same members are on an existing card, if the card has been modified" do
    end

    it "does nothing when trying to save a collaberation on a card which already exists and has not been modified" do
      allow(Collaberation).to receive(:where).with(card: 1).and_return [collaberation_1]
      expect(CollaberationPersister).not_to receive(:new)
      CardPersister.save([collaberation_1_hash])
    end
  end
end
