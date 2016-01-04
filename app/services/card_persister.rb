class CardPersister
  def self.save collaberations
    collaberations.each do |collaberation_hash|
      collaberation_members = collaberation_hash.delete(:members)
      collaberation = Collaberation.new(collaberation_hash)
      collaberation.members = collaberation_members
    end
  end
end
