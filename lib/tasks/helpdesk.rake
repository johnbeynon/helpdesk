task :environment => :disable_helpdesk_initializer

task :disable_helpdesk_initializer do
    ENV['SKIP_HELPDESK_INITIALIZER'] = 'true' if ENV['SKIP_HELPDESK_INITIALIZER'].nil?
end

namespace :helpdesk do
  desc "Install helpdesk"
  task :install do
    system 'rails g helpdesk:install'
  end

  desc "Uninstall helpdesk"
  task :uninstall do
    system 'rails g helpdesk:uninstall'
  end
end
