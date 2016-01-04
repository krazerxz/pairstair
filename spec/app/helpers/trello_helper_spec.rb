require "rails_helper"

describe TrelloHelper do
  describe "member" do
    let(:trello_member) { double(:trello_member) }

    it "returns the trello member given by the trello_access_member" do
      allow(Trello::Member).to receive(:find).with("testuser").and_return(trello_member)
      expect(TrelloHelper.member).to eq trello_member
    end
  end
end

# Trello.configure do |config|
# config.developer_public_key = ENV["trello_developer_public_key"]
# config.member_token         = ENV["trello_member_token"]
# end
