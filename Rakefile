require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'yard/rake_task'

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = %w(--format documentation --color)
end

task :default => :spec
