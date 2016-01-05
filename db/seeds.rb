puts "Loading #{Rails.env} seed"
env_seed = File.expand_path("#{Rails.env}_seed.rb", __dir__)
load env_seed if File.exist? env_seed
puts "Done"
