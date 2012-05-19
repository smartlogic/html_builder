require "rspec/core/rake_task"
require "cucumber/rake/task"
require "cane/rake_task"

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:cucumber)

  Cane::RakeTask.new(:quality) do |cane|
    cane.abc_max = 10
    cane.style_measure = 72
    cane.no_doc = true

    if RUBY_ENGINE == "ruby"
      cane.add_threshold 'coverage/covered_percent', :>=, 100
    end
end

task :default => [:spec, :cucumber, :quality]
