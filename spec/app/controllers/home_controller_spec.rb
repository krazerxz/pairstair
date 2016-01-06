require "rails_helper"

describe HomeController, type: :controller do
  describe "#GET index" do
    let(:collaberations) { [double(:collaberation_1), double(:collaberation_2)] }
    let(:pair_sets)      { double(:pair_sets) }
    let(:pairs)          { [{"1" => "2"}, {"2" => "3"}] }
    let(:stair_html)     { "<html><table>...</table></html>" }
    let(:members)        { [double(:member_1), double(:member_2)] }

    before do
      allow(Collaberation).to receive(:includes).with(:members).and_return(collaberations)
      allow(PairSets).to receive(:new).and_return(pair_sets)
      allow(pair_sets).to receive(:calculate).and_return(pairs)
      allow(OrganizationMember).to receive(:all).and_return(members)
      allow(StairBuilder).to receive(:html).and_return(stair_html)
    end

    it "creates sets of pairs from collaberations" do
      expect(PairSets).to receive(:new).with(collaberations)
      expect(pair_sets).to receive(:calculate)
      get :index
    end

    it "assignes all organization members" do
      get :index
      expect(assigns(:members)).to eq members
    end

    it "creates the stair html" do
      expect(StairBuilder).to receive(:html).with(members, pairs)
      get :index
    end

    it "assigns the stair html" do
      get :index
      expect(assigns(:stair)).to eq stair_html
    end
  end
end
