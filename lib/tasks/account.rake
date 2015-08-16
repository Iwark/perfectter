namespace :account do
  # descの記述は必須
  desc "Account"

  task create_candidates: :environment do
    result = Benchmark.realtime do
      Account.create_candidates(3)
    end
    puts "create_candidates: #{result}s"
  end

end