class HomeController < ApplicationController
  def index
    collaberations = Collaberation.includes(:members)
    pairs = PairSets.new(collaberations).calculate
    @members = OrganizationMember.all
    @stair = StairBuilder.html(@members, pairs)
  end
end

class StairBuilder
  def self.html members, pairs
    side = "#{100 / members.length}%"
    table_row = "<tr height='" + side + "'>"
    table_header = "<th width='" + side + "' height='" + side + "'>"
    last_table_header = "<th width='" + side + "' height='" + side + "' class='last'>"
    pre_td = "<td width='" + side + "' height='" + side + "'>"
    post_td = "</td>"
    html = "<table>"

    members.length.times do |row_index|
      html << table_row

      (0...row_index).each do |column_index|
        html << pre_td
        html << "X" if pairs.find {|pair| pair[members[row_index - 1].trello_uuid] == members[column_index + 1].trello_uuid }
        html << post_td
      end
      if row_index == members.length - 1
        html << last_table_header
      else
        html << table_header
      end
      html << members[row_index].name + "<\/th><\/tr>"
    end
    html << "<\/table>"
  end
end
