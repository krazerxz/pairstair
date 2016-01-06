require "rails_helper"

describe PairSets do
  let(:members_for_1)  { [double(:members_for_1, member_uuid: "2"), double(:members_for_1, member_uuid: "3")] }
  let(:members_for_2)  {
    [double(:members_for_2, member_uuid: "1"),
     double(:members_for_2, member_uuid: "2"),
     double(:members_for_2, member_uuid: "3")]
  }
  let(:collaberations) {
    [
      double(:collaberation_1, members: members_for_1),
      double(:collaberation_2, members: members_for_2)]
  }

  subject              { described_class.new(collaberations) }

  describe "calculate" do
    it "returns all tuples for the given collaberations" do
      expect(subject.calculate).to eq [{"2" => "3"}, {"3" => "2"}, {"1" => "2"}, {"1" => "3"}, {"2" => "1"}, {"2" => "3"}, {"3" => "1"}, {"3" => "2"}]
    end
  end
end
