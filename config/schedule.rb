job_type :script, "cd :path && RACK_ENV=:environment bundle exec scripts/:task :output"

every 5.minutes do
  script "update_cards.rb"
end
