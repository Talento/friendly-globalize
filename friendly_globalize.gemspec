# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'friendly_globalize/version'

Gem::Specification.new do |spec|
  spec.name          = "friendly_globalize"
  spec.version       = FriendlyGlobalize::VERSION
  spec.authors       = ["Alejandro León"]
  spec.email         = ["alejandro.leon@the-cocktail.com"]
  spec.summary       = %q{Friendly globalize slugs}
  spec.description   = %q{Friendly globalize slugs}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "globalize-accessors", "~> 0.2.1"
  spec.add_dependency "globalize", "~> 5.0.1"
  spec.add_dependency "friendly_id-globalize", "~> 1.0.0.alpha1"
  spec.add_dependency "friendly_id", "~> 5.1.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency 'rake', '~> 0'

  spec.add_development_dependency "mysql2", "~> 0.3.16"
  spec.add_development_dependency "pry", "~> 0.10.1"
  spec.add_development_dependency "binding_of_caller", "~> 0.7.2"
  spec.add_development_dependency 'minitest-rails-capybara', '~> 2.1', '>= 2.1.1'
  spec.add_development_dependency 'minitest-reporters', '~> 1.0', '>= 1.0.5'
  spec.add_development_dependency 'database_cleaner', '~> 1.3', '>= 1.3.0'
end
