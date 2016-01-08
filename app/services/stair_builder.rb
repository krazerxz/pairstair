class StairComponent
  def initialize member_count
    @members = member_count
  end

  def table_row
    "<tr height='" + side + "'>"
  end

  def pre_td
    "<td width='" + side + "' height='" + side + "'>"
  end

  def post_td
    "</td>"
  end

  def cell_content
    "<i class='fa fa-star'></i>"
  end

  def table_header_for row_index
    if row_index == @members - 1
      return last_table_header
    else
      return table_header
    end
  end

  private

  def side
    @side ||= "#{100 / @members}%"
  end

  def table_header
    "<th width='" + side + "' height='" + side + "'>"
  end

  def last_table_header
    "<th width='" + side + "' height='" + side + "' class='last'>"
  end
end

class MemberInfo
  attr_reader :members
  def initialize members
    @members = members
  end

  def count
    @members.count
  end

  def member_name_at index
    @members[index].name
  end
end

class StairBuilder
  def initialize members, pairs
    @member_info = MemberInfo.new(members)
    @pairs = pairs
    @stair_component = StairComponent.new(@member_info.count)
  end

  def html
    html = "<table>"

    @member_info.count.times do |row_index|
      html << @stair_component.table_row

      (0...row_index).each do |column_index|
        html << @stair_component.pre_td
        pairs_occuring_at(row_index, column_index, @pairs, @member_info.members).times.each do
          html << @stair_component.cell_content
        end
        html << @stair_component.post_td
      end

      html << @stair_component.table_header_for(row_index)


      html << @member_info.member_name_at(row_index)  + "<\/th><\/tr>"
    end
    html << "<\/table>"
  end

  def pairs_occuring_at row_index, column_index, pairs, members
    pairs.count {|pair| pair[members[row_index].trello_uuid] == members[column_index].trello_uuid }
  end
end
