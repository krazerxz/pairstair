class CardRetriever
  def self.update
    collaberations = TrelloWrapper.current_collaberations
    CardPersister.save collaberations
  end
end
