require "rails_helper"

describe CardPersister do
  describe "save" do
    let(:member_1)        { double(:member_1) }
    let(:collaberation_1) { {card: 1, last_activity_date: Date.today, members: [member_1]} }
    let(:collaberation)   { double(:collaberation) }

    before do
      allow(Collaberation).to receive(:new).and_return(collaberation)
    end

    it 'saves new cards' do
      expect(Collaberation).to receive(:new).with({card: 1, last_activity_date: Date.today})
      expect(collaberation).to receive(:members=).with([member_1])
      CardPersister.save([collaberation_1])
    end

    it 'saves seperate collaberation for changing members on existing card do' do

    end

    it 'saves a collaberation where the same members are on an existing card, if the card has been modified' do

    end

    it 'does nothing when trying to save a collaberation on a card which already exists and has not been modified' do

    end
  end
end
