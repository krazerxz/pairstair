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
        pairs_occuring_at(row_index, column_index, pairs, members).times.each do
          html << "<i class='fa fa-star'></i>"
        end
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

  def self.pairs_occuring_at row_index, column_index, pairs, members
    pairs.count {|pair| pair[members[row_index].trello_uuid] == members[column_index].trello_uuid }
  end
end
