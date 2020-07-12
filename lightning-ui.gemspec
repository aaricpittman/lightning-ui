$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'lightning/ui/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'lightning-ui'
  spec.version     = Lightning::UI::VERSION
  spec.authors     = ['Aaric Pittman']
  spec.email       = ['aaricpittman@gmail.com']
  spec.homepage    = 'https://github.com/aaricpittman/lightning-ui'
  spec.summary     = 'Rails view components for Salesforce Lightning Design System'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 6.0.3', '>= 6.0.0.0'
  spec.add_dependency 'view_component', '~> 2.14', '>= 2.0'

  spec.add_development_dependency 'capybara', '~> 3.33'
  spec.add_development_dependency 'pry', '~> 0.13'
  spec.add_development_dependency 'rspec-rails', '~> 4.0'
  spec.add_development_dependency 'rubocop', '~> 0.87'
  spec.add_development_dependency 'solargraph', '~> 0.39'
  spec.add_development_dependency 'sqlite3', '~> 1.4'
end
