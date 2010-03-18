# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{eyeballer}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Groves"]
  s.date = %q{2010-03-18}
  s.description = %q{A simple observer library}
  s.email = %q{adam.groves@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    "LICENSE",
     "README.md",
     "Rakefile",
     "lib/eyeballer.rb",
     "spec/eyeballer/eyeballer_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/addywaddy/eyeballer}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Foo}
  s.test_files = [
    "spec/eyeballer/eyeballer_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<extlib>, [">= 0.9.12"])
    else
      s.add_dependency(%q<extlib>, [">= 0.9.12"])
    end
  else
    s.add_dependency(%q<extlib>, [">= 0.9.12"])
  end
end
