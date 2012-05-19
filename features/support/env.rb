require "bundler"
Bundler.setup

require "aruba/cucumber"

# Try to make JRuby boot faster to avoid timeouts
Aruba.configure do |config|
  config.before_cmd do |cmd|
    set_env("JRUBY_OPTS", "-X-C #{ENV["JRUBY_OPTS"]}")
    set_env("JAVA_OPTS", "-d32 #{ENV["JAVA_OPTS"]}")
  end
end if RUBY_PLATFORM == "java"

# JRuby is still slow, though, so bump timeout limit
Before do
  @aruba_timeout_seconds = 5
end
