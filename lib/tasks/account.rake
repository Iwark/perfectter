namespace :account do
  # descの記述は必須
  desc "Account"

  task create_candidates: :environment do

    status = Rails.cache.read("create_candidates_status") || 'done'
    if status == 'done'
      Rails.cache.write("create_candidates_status", 'executing')
      result = Benchmark.realtime do
        Group.all.each do |group|
          group.create_candidates(group.add_count)
        end
      end
      puts "create_candidates: #{result}s"
      Rails.cache.write("create_candidates_status", 'done')
    end
  end

end