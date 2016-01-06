class PairSets
  def initialize collaberations
    @collaberations = collaberations
  end

  def calculate
    @collaberations.flat_map { |collaberation|
      pairs_for collaberation.members
    }.uniq
  end

  private

  def pairs_for members
    members.map(&:member_uuid).permutation(2).map do |pair|
      Hash[*pair]
    end
  end
end
