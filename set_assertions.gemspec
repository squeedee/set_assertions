# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "set_assertions/version"

Gem::Specification.new do |s|
  s.name        = "set_assertions"
  s.version     = SetAssertions::VERSION
  s.authors     = ["Rasheed Abdul-Aziz"]
  s.email       = ["squeedee@gmail.com"]
  s.homepage    = "http://squeedee.tumblr.com"
  s.summary     = %q{TODO: New test-unit assertions for checking set equality and other set functions}
  s.description = %q{TODO: New test-unit assertions for checking set equality and other set functions}

  #s.rubyforge_project = "set_assertions"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "test-unit"
  s.add_development_dependency "rake"
  s.add_runtime_dependency "test-unit"
end
