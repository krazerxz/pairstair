class StairComponent
  def initialize member_count
    @members = member_count
  end

  def last_header_needed_for? row_index
    row_index == @members - 1
  end

  def box_size
    @side ||= "#{100 / @members}%"
  end
end
