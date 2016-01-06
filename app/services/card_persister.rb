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
      return true if collaberation.last_activity_date.to_i == collaberation_hash[:last_activity_date].to_i
    end
    false
  end

  private_class_method :card_exists_with_collaberators_and_unmodified?
end
