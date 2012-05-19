Dir[File.expand_path("../support/**/*.rb", __FILE__)].each do |file|
  require file
end

SimpleCov.start
