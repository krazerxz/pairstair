OrganizationMember.destroy_all

TrelloWrapper.organization_members.each do |member_hash|
  OrganizationMember.create(member_hash)
end
