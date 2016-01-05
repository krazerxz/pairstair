module TrelloHelper
  require "trello"

  Trello.configure do |config|
    config.developer_public_key = ENV["trello_developer_public_key"]
    config.member_token         = ENV["trello_member_token"]
  end

  def self.member
    Trello::Member.find(ENV["trello_access_member"])
  end

  def self.organization_members
    Trello::Organization.find(ENV["trello_organization_id"]).members
  end
end
