require "rails_helper"

describe HomeController, type: :controller do
  describe "#GET index" do
    let(:collaberations) { [double(:collaberation_1), double(:collaberation_2)] }
    let(:members)        { [double(:member_1), double(:member_2)] }
    let(:member_info)    { [double(:member_info)] }

    before do
      allow(Collaberation).to receive(:includes).with(:members).and_return(collaberations)
      allow(OrganizationMember).to receive(:all).and_return(members)
      allow(MemberInfo).to receive(:new).with(members, collaberations).and_return(member_info)
    end

    it "fetches all organization members" do
      expect(OrganizationMember).to receive(:all)
      get :index
    end

    it "fetches all collaberations" do
      expect(Collaberation).to receive(:includes).with(:members)
      get :index
    end

    it "creates a member info" do
      expect(MemberInfo).to receive(:new).with(members, collaberations)
      get :index
    end

    it "assigns the stair html" do
      get :index
      expect(assigns(:member_info)).to eq member_info
    end
  end
end
