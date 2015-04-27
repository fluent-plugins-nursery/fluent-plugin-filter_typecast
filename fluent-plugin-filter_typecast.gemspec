# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "fluent-plugin-filter_typecast"
  s.version     = "0.0.2"
  s.authors     = ["Naotoshi Seo"]
  s.email       = ["sonots@gmail.com"]
  s.homepage    = "https://github.com/sonots/fluent-plugin-filter_typecast"
  s.summary     = "A Fluentd filter plugin to cast record types"
  s.description = s.summary
  s.licenses    = ["MIT"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "fluentd", ">= 0.12"
  s.add_development_dependency "rake"
  s.add_development_dependency "test-unit"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-nav"
end
