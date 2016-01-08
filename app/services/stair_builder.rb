class StairComponent
  def initialize member_count
    @members = member_count
  end

  def side
    @side ||= "#{100 / @members}%"
  end

  def table_row
    "<tr height='" + side + "'>"
  end
  def table_header
    "<th width='" + side + "' height='" + side + "'>"
  end

  def last_table_header
    "<th width='" + side + "' height='" + side + "' class='last'>"
  end

  def pre_td
    "<td width='" + side + "' height='" + side + "'>"
  end

  def post_td
    "</td>"
  end
end

class StairBuilder
  def initialize members, pairs
    @members = members
    @pairs = pairs
    @stair_component = StairComponent.new(members.count)
  end

  def html
    html = "<table>"

    @members.length.times do |row_index|
      html << @stair_component.table_row

      (0...row_index).each do |column_index|
        html << @stair_component.pre_td
        pairs_occuring_at(row_index, column_index, @pairs, @members).times.each do
          html << "<i class='fa fa-star'></i>"
        end
        html << @stair_component.post_td
      end
      if row_index == @members.length - 1
        html << @stair_component.last_table_header
      else
        html << @stair_component.table_header
      end
      html << @members[row_index].name + "<\/th><\/tr>"
    end
    html << "<\/table>"
  end

  def pairs_occuring_at row_index, column_index, pairs, members
    pairs.count {|pair| pair[members[row_index].trello_uuid] == members[column_index].trello_uuid }
  end
end
