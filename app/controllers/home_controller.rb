class HomeController < ApplicationController
  def index
    collaberations = Collaberation.includes(:members)
    pairs = PairSets.new(collaberations).calculate
    @members = OrganizationMember.all
    @stair = StairBuilder.html(@members, pairs)
  end
end
