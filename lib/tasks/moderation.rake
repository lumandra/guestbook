namespace :moderation do
  desc "Checking messages status"
  task :start => :environment do
    Message.moderation
  end
end