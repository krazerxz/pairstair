OrganizationMember.destroy_all

TrelloWrapper.organization_members.each do |member_hash|
  OrganizationMember.create(trello_uuid: member_hash.id, name: member_hash.full_name)
end
