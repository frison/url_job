# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "url_job/version"

Gem::Specification.new do |s|
  s.name        = "url_job"
  s.version     = UrlJob::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Timothy Frison"]
  s.email       = ["tim@frison.ca"]
  s.homepage    = "http://frison.ca/"
  s.summary     = %q{A rails engine for creating urls that run jobs}
  s.description = <<-EOF
  Need to track if an email was opened? If a link was clicked? If a page was viewed?
  Too lazy to setup cron (or is it impossible?)?

  Easy -- Just create a url_job that when visited does things (like the above) for you.
  EOF

  s.rubyforge_project = "url_job"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('uniquify', '>= 0.1.0')
  s.add_dependency('rails', '>= 3.0.0')
end
