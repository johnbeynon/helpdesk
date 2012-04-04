$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "helpdesk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "helpdesk"
  s.version     = Helpdesk::VERSION
  s.authors     = ["John Beynon"]
  s.email       = ["john@beynon.org.uk"]
  s.homepage    = "http://github.com/johnbeynon/helpdesk"
  s.summary     = "Rails 5 mountable engine providing basic helpdesk functionality for your applications"
  s.description = "TODO: Description of Helpesk."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_development_dependency 'rspec-rails'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
