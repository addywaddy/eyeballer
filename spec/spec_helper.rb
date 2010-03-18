begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'eyeballer'

Spec::Runner.configure do |config|
end
