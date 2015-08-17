namespace :account do
  # descの記述は必須
  desc "Account"

  task create_candidates: :environment do
    result = Benchmark.realtime do
      Group.all.each do |group|
        group.create_candidates(group.add_count)
      end
    end
    puts "create_candidates: #{result}s"
  end

end