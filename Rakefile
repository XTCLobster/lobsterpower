require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

desc "Install dependencies to run the app"
task :setup do
  system %Q{bundle install}
end

desc "Run the game from this folder locally"
task :run do
  system %Q{ruby -I "#{File.join(File.dirname(__FILE__), "lib")}" "#{File.join(File.dirname(__FILE__), "app", "main.rb")}"}
end

task :default => :run
