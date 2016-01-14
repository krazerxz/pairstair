class MemberInfo
  attr_reader :members
  def initialize members, collaberations
    @members = members
    @collaberations = collaberations
  end

  def count
    @members.count
  end

  def member_name_at index
    @members[index].name
  end

  def collaberations_at index_1, index_2
    pairs.count {|collaberation| collaberation[@members[index_1].trello_uuid] == @members[index_2].trello_uuid }
  end

  def last_header_needed_for? row_index
    row_index == count - 1
  end

  def box_size
    @side ||= "#{100 / count}%"
  end

  private

  def pairs
    @collaberations.flat_map {|collaberation| pairs_for collaberation.members }
  end

  def pairs_for members
    members.map(&:member_uuid).permutation(2).map do |pair|
      Hash[*pair]
    end
  end
end
