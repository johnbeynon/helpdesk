$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "helpdesk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "helpdesk"
  s.version     = Helpdesk::VERSION
  s.authors     = ["John Beynon Wacław Łuczak"]
  s.email       = ["john@beynon.org.uk, waclaw@luczak.it"]
  s.homepage    = "http://github.com/johnbeynon/helpdesk"
  s.summary     = "Rails mountable engine providing basic helpdesk functionality for your applications"
  s.description = "Helpesk includes: tickets, ticket_types, faq, subscribers"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile"]
  s.require_paths = ['lib']

  s.add_development_dependency "launchy"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'devise'
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "foreman"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "letter_opener"

  s.add_dependency "chosen-rails"
  s.add_dependency "rails_autolink"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "rails", ">= 3.2.3"
  s.add_dependency 'sass-rails', '>= 3.2.3'
  s.add_dependency 'simple_form'
  s.add_dependency 'state_machine'
  s.add_dependency 'globalize3'
  s.add_dependency 'batch_translations'
  s.add_dependency 'ckeditor'
end
