When "I start the card updater" do
  Timecop.freeze(Time.local(2016, 1, 1)) do
    CardRetriever.update
  end

end

Then "I should see collaborations in the database" do
  expect(Collaberation.count).to eq 2
  # From VCR
  expect(Collaberation.first).to match( {:id=>"id_1", :last_activity_date=>Date.parse(2015, 1, 1), :member_ids=>["member_1"]} )
  expect(Collaberation.first).to match( {:id=>"id_2", :last_activity_date=>Date.parse(2016, 1, 1), :member_ids=>["member_2", "member_3"]} )
end
