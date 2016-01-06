class CollaberationPersister
  def initialize collaberation_hash
    @collaberation_hash = collaberation_hash
  end

  def persist
    parse
    @collaberation = Collaberation.new(@collaberation_hash)
    @collaberation.members = members
    @collaberation.save
  end

  def parse
    @collaberation_member_ids = @collaberation_hash.delete(:members)
  end

  private

  def members
    @collaberation_member_ids.map {|member_uuid| Member.create(collaberation: @collaberation, member_uuid: member_uuid) }
  end
end
