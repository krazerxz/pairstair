class HomeController < ApplicationController
  def index
    members = OrganizationMember.all
    collaberations = Collaberation.includes(:members)

    member_info = MemberInfo.new(members, collaberations)
    @stair = StairBuilder.new(member_info).html
  end
end
