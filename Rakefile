# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc "Lint with rubocop"
task :lint do
  sh "bundle exec rubocop"
end

RSpec::Core::RakeTask.new(:spec)

task default: %i[lint spec]
