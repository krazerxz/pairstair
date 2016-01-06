When "I start the card updater" do
  Timecop.freeze(Time.local(2016, 1, 1)) do
    VCR.use_cassette "fetch_cards" do
      CardRetriever.update
    end
  end
end

Then "I should see collaborations in the database" do
  expect(Collaberation.count).to eq 1
  expected_result = [{"card" => "565d6da875cd637f3c1fcf82", "last_activity_date" => Time.parse("Sun, 13 Dec 2015 20:18:59")}]
  expected_members = [%w(55acd5018b4a2a1a0afe7d74 5652f11b1be7f1189b548048)]
  Collaberation.all.each_with_index do |collaberation, index|
    expect(collaberation.card).to eq(expected_result[index]["card"])
    expect(collaberation.last_activity_date.to_i).to eq(expected_result[index]["last_activity_date"].to_i)
    collaberation_members = collaberation.members.map(&:member_uuid)
    expect(collaberation_members).to eq(expected_members[index])
  end
end
