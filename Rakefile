require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

if ENV['COVERAGE']
  require 'ci/reporter/rake/rspec'
  task :spec => 'ci:setup:rspec'
end

# If you want to make this the default task
task :default => :spec
