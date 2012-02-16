# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "js_fun_on_rails/version"

Gem::Specification.new do |s|
  s.name        = "js_fun_on_rails"
  s.version     = JsFunOnRails::VERSION
  s.authors     = ["Rik Vanmechelen"]
  s.email       = ["rik.vanmechelen@gmail.com"]
  s.homepage    = ""
  s.summary     = "A simple gem to add and remove fields"
  s.description = "A simple gem to add and remove fields as seen in railscast episode 197"

  s.rubyforge_project = "js_fun_on_rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'railties', '>= 3.1'
  s.add_dependency 'jquery-rails'
end
