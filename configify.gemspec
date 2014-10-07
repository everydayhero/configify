# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'configify/version'

Gem::Specification.new do |spec|
  spec.name          = "configify"
  spec.version       = Configify::VERSION
  spec.authors       = ["soloman"]
  spec.email         = ["soloman1124@gmail.com"]
  spec.summary       = %q{Simple utility to set config properties}
  spec.description   = %q{Simple utility to set config properties}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.1'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end