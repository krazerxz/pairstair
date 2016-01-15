class CollaberationPersister
  def initialize collaberation_hash
    @collaberation_hash = collaberation_hash
  end

  def persist
    member_ids = @collaberation_hash.delete(:members)
    @collaberation = Collaberation.new(@collaberation_hash)
    members = member_ids.map {|id| create_member_with(id) }
    @collaberation.members = members
    @collaberation.save
  end

  private

  def create_member_with id
    Member.create(collaberation: @collaberation, member_uuid: id)
  end
end
