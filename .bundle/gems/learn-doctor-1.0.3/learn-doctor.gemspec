# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'learn_doctor/version'

Gem::Specification.new do |spec|
  spec.name          = "learn-doctor"
  spec.version       = LearnDoctor::VERSION
  spec.authors       = ["Flatiron School"]
  spec.email         = ["learn@flatironschool.com"]
  spec.summary       = %q{Check your environment setup against Learn.co's defaults}
  spec.homepage      = "https://learn.co"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "bin"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "netrc"
  spec.add_runtime_dependency "faraday", "~> 0.9"
  spec.add_runtime_dependency "colorize"
  spec.add_runtime_dependency "learn-web", ">= 1.1.0"
end
