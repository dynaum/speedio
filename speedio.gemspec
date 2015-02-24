# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'speedio/version'

Gem::Specification.new do |spec|
  spec.name          = "speedio"
  spec.version       = Speedio::VERSION
  spec.authors       = ["Parafuzo Core Team"]
  spec.email         = ["dev@parafuzo.com"]
  spec.summary       = %q{Speddio Ruby Library}
  spec.description   = %q{Ruby version for Speedio API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "multipart-post", "~> 2.0.0"
end
