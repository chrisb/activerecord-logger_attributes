lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_record/logger_attributes/version"

Gem::Specification.new do |spec|
  spec.name = "activerecord-logger_attributes"
  spec.version = ActiveRecord::LoggerAttributes::VERSION
  spec.authors = ['Chris Bielinski']
  spec.email = ['chris@shadow.io']

  spec.summary = "Save Ruby's Logger messages to a database column"
  spec.description = "Save Ruby's Logger messages to a database column"
  spec.homepage = 'https://github.com/chrisb/activerecord-logger_attributes'
  spec.license = 'MIT'
  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']
  spec.add_dependency 'activemodel-logger_attributes', '~> 0.1'
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
end
