# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'audience_manager/version'

Gem::Specification.new do |spec|
  spec.name          = 'audience_manager'
  spec.version       = AudienceManager::VERSION
  spec.authors       = ['Reginaldo Sousa']
  spec.email         = ['reginaldo.rms@gmail.com']
  spec.description   = 'Ruby client to Adobe Audience Management'
  spec.summary       = 'TODO: Write a gem summary'
  spec.homepage      = 'https://github.com/reginaldosousa/audience_manager'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'oauth2'
  spec.add_dependency 'extlib'
  spec.add_dependency 'virtus'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'rspec-nc'

  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-rcov'
  spec.add_development_dependency 'ci_reporter_rspec'
  spec.add_development_dependency 'coveralls'

end
