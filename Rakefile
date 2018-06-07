require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :build do
  system "gem build user_naming.gemspec"
end

task release: :build do
  system "gem push bundler-#{UserNaming::VERSION}"
end
