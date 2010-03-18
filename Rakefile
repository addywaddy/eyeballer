require 'rake'
require File.join(File.expand_path(File.dirname(__FILE__)),'lib','eyeballer')

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "eyeballer"
    s.date = "2010-03-18"
    s.summary = %Q{Foo}
    s.email = "adam.groves@gmail.com"
    s.homepage = "http://github.com/addywaddy/eyeballer"
    s.description = "A simple observer library"
    s.has_rdoc = true
    s.authors = ["Adam Groves"]
    s.files = %w( LICENSE README.md Rakefile ) + Dir["{lib,spec}/**/*"]
    s.extra_rdoc_files = %w( README.md LICENSE )
    s.require_path = "lib"
    s.add_dependency("extlib", ">= 0.9.12")
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'eyeballer'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.libs << 'lib' << 'spec'
  t.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |t|
  t.libs << 'lib' << 'spec'
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
end

task :default => :spec
