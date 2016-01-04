class CardPersister
  def self.save collaberations
    collaberations.each do |collaberation_hash|
      next if card_exists_with_collaberators_and_unmodified? collaberation_hash
      create_collaberation_for collaberation_hash
    end
  end

  def self.card_exists_with_collaberators_and_unmodified? collaberation_hash
    collaberations = Collaberation.where(card: collaberation_hash[:card])
    collaberations.each do |collaberation|
      return true if collaberation.last_activity_date == collaberation_hash[:last_activity_date]
    end
    false
  end

  def self.create_collaberation_for collaberation_hash
    collaberation_members = collaberation_hash.delete(:members)
    collaberation = Collaberation.new(collaberation_hash)
    collaberation.members = collaberation_members
    collaberation.save
  end

  private_class_method :create_collaberation_for
end
