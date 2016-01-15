require "rails_helper"

describe CollaberationPersister do
  let(:member_ids)                       { %w(123 456) }
  let(:collaberation_hash)               { {card: "trello_card_id", last_activity_date: Date.today} }
  let(:collaberation_hash_with_members)  { collaberation_hash.merge(members: member_ids) }
  let(:collaberation)                    { double(:collaberation).as_null_object }
  let(:member_1)                         { double(:member_1) }
  let(:member_2)                         { double(:member_2) }

  subject { described_class.new(collaberation_hash_with_members) }

  before do
    allow(Collaberation).to receive(:new).and_return(collaberation)
    allow(Member).to receive(:create).and_return(member_1, member_2)
  end

  describe "persist" do
    it "builds a new collaberation" do
      expect(Collaberation).to receive(:new).with(collaberation_hash)
      subject.persist
    end

    it "creates a new member for each member id" do
      expect(Member).to receive(:create).with(collaberation: collaberation, member_uuid: "123")
      expect(Member).to receive(:create).with(collaberation: collaberation, member_uuid: "456")
      subject.persist
    end

    it "assigns the members to the collaberation" do
      expect(collaberation).to receive(:members=).with([member_1, member_2])
      subject.persist
    end

    it "saves the collaberation" do
      expect(collaberation).to receive(:save)
      subject.persist
    end
  end
end
