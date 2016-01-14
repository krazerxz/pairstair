class HomeController < ApplicationController
  def index
    members = OrganizationMember.all
    collaberations = Collaberation.includes(:members)

    @member_info = MemberInfo.new(members, collaberations)
    @stair_component = StairComponent.new(members.count)
  end
end
