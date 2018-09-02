# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'international_date_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "international_date_parser"
  spec.version       = InternationalDateParser::VERSION
  spec.authors       = ["Humberto"]
  spec.email         = ["hlsp999@gmail.com"]
  spec.summary       = "Parse string and arrays to date"
  spec.description   = "Ruby class Date extension to translate months and then parse the string or array"
  spec.homepage      = 'http://github.com/frenesim/international_date_parser'
  spec.license       = "MIT"
  spec.files       = ["lib/international_date_parser.rb"]

  # spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  #spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  # spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug", "~> 8.2"

  spec.add_development_dependency('rspec')
  spec.add_development_dependency('guard-rspec')
  spec.add_development_dependency('simplecov')

  spec.required_ruby_version = '>= 1.9.3'
end
