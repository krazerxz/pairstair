class CardPersister
  def self.save collaberations
    collaberations.each do |collaberation_hash|
      next if card_exists_with_collaberators_and_unmodified? collaberation_hash
      CollaberationPersister.new(collaberation_hash).persist
    end
  end

  def self.card_exists_with_collaberators_and_unmodified? collaberation_hash
    collaberations = Collaberation.where(card: collaberation_hash[:card])
    collaberations.each do |collaberation|
      return true if collaberation.last_activity_date == collaberation_hash[:last_activity_date]
    end
    false
  end

  private_class_method :card_exists_with_collaberators_and_unmodified?
end

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
