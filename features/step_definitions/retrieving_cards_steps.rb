When "I start the card updater" do
  Timecop.freeze(Time.local(2016, 1, 1)) do
    VCR.use_cassette "fetch_cards" do
      CardRetriever.update
    end
  end
end

Then "I should see collaborations in the database" do
  expect(Collaberation.count).to eq 2
  expect(Collaberation.first.attributes).to include("card": "565341d7b9ea6441ae681cf6", last_activity_date: Date.parse("Mon, 07 Dec 2015 11:25:47"))
  expect(Collaberation.second.attributes).to include(card: "565d6da875cd637f3c1fcf82", last_activity_date: Date.parse("Sun, 13 Dec 2015 20:18:59"))
  debugger
  expect(Collaberation.fist.members).to match
  expect(Collaberation.last.members).to match
end
