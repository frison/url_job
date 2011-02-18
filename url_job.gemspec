# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "url_job/version"

Gem::Specification.new do |s|
  s.name        = "url_job"
  s.version     = UrlJob::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Timothy Frison"]
  s.email       = ["tim@frison.ca"]
  s.homepage    = "http://github.com/frison/url_job"
  s.summary     = %q{A rails engine for creating urls that run jobs}
  s.description = s.summary

  s.rubyforge_project = "url_job"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('uniquify', '>= 0.1.0')
  s.add_dependency('rails', '>= 3.0.0')
end
