# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pcurl/version'

Gem::Specification.new do |spec|
  spec.name          = 'pcurl'
  spec.version       = PcURL::VERSION
  spec.authors       = ['Ben Snape']
  spec.email         = ['bsnape@gmail.com']
  spec.summary       = %q{Pretty print cURL responses in your terminal.}
  spec.homepage      = 'http://www.bensnape.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['pcurl']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rspec', '~> 2.14'
  spec.add_dependency 'curb', '~> 0.8'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.1'
end
