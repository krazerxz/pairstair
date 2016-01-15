require "rails_helper"

describe MemberInfo do
  let(:organization_member_1)       { build(:organization_member) }
  let(:organization_member_2)       { build(:organization_member) }
  let(:member_1)                    { build(:member, member_uuid: organization_member_1.trello_uuid) }
  let(:member_2)                    { build(:member, member_uuid: organization_member_2.trello_uuid) }
  let(:members)                     { [organization_member_1, organization_member_2] }
  let(:collaberations)              { [build(:collaberation, members: [member_1, member_2])] }

  subject { described_class.new(members, collaberations) }

  describe "count" do
    it "returns the number of members" do
      expect(subject.count).to eq 2
    end
  end

  describe "member_name_at" do
    it "returns the name of the member at the given index" do
      expect(subject.member_name_at(1)).to eq organization_member_2.name
    end
  end

  describe "box_size" do
    it "returns the length of a box edge" do
      allow(subject).to receive(:count).and_return 5
      expect(subject.box_size).to eq "20%"
    end
  end

  describe "last_header_needed_for?" do
    it "returns true if a final header is needed" do
      allow(subject).to receive(:count).and_return 1
      expect(subject.last_header_needed_for?(1)).to eq false
    end
  end

  describe "collaberations_at" do
    context "no collaberations" do
      it "returns the number of collaberations that occur at the intersection of two members" do
        expect(subject.collaberations_at(1, 0)).to eq 1
      end
    end

    context "a collaberation" do
      it "returns the number of collaberations that occur at the intersection of two members" do
        expect(subject.collaberations_at(1, 1)).to eq 0
      end
    end
  end
end
