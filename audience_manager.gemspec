# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'audience_manager/version'

Gem::Specification.new do |spec|
  spec.name          = "audience_manager"
  spec.version       = AudienceManager::VERSION
  spec.authors       = ["Reginaldo Sousa"]
  spec.email         = ["reginaldo.rms@gmail.com"]
  spec.description   = %q{Ruby client to Adobe Audience Management}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = "https://github.com/reginaldosousa/audience_manager"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
