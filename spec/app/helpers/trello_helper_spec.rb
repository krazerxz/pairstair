require "rails_helper"

describe TrelloHelper do
  describe "member" do
    let(:trello_member) { double(:trello_member) }

    it "returns the trello member given by the trello_access_member" do
      allow(Trello::Member).to receive(:find).with("testuser").and_return(trello_member)
      expect(TrelloHelper.member).to eq trello_member
    end
  end

  describe "organization_members" do
    let(:organization_members) { [double(:member_1, id: 1, full_name: "chris"), double(:member_2, id: 2, full_name: "james")] }
    let(:organization)         { double(:organization, members: organization_members) }

    it "returns the members of the organization given by the trello_organization_id" do
      allow(Trello::Organization).to receive(:find).with("559a469f07b1a13dcbc32258").and_return(organization)
      expect(TrelloHelper.organization_members).to eq(organization_members)
    end
  end
end

# Trello.configure do |config|
# config.developer_public_key = ENV["trello_developer_public_key"]
# config.member_token         = ENV["trello_member_token"]
# end
