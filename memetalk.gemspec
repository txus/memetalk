# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "memetalk/version"

Gem::Specification.new do |s|
  s.name        = "memetalk"
  s.version     = Memetalk::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Josep M. Bach"]
  s.email       = ["josep.m.bach@gmail.com"]
  s.homepage    = "http://github.com/txus/memetalk"
  s.summary     = %q{Send auto-generated memes to Talkerapp rooms!}
  s.description = %q{Send auto-generated memes to Talkerapp rooms!}

  s.rubyforge_project = "memetalk"

  s.add_runtime_dependency 'talker'
  s.add_runtime_dependency 'meme_generator'

  s.add_development_dependency 'rspec'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
