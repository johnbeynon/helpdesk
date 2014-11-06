require 'rails'
require 'simple_form'
require 'state_machine'
require 'bootstrap-sass'
require 'rails_autolink'
require 'simple_form'
require 'globalize'
require 'batch_translations'
require 'ckeditor'
require 'select2-rails'
require 'kaminari'
require 'jquery-ui-rails'
require 'acts_as_ordered_tree'

module Helpdesk
  class Engine < ::Rails::Engine
    isolate_namespace Helpdesk

    initializer "Helpdesk precompile hook" do |app|
      app.config.assets.precompile += ['helpdesk/admin.css','helpdesk/application.css','helpdesk/application.js']
    end

    config.to_prepare do
      if Helpdesk.user_class
        Helpdesk.user_class.has_many :helpdesk_tickets, :class_name => "Helpdesk::Ticket", :foreign_key => "requester_id"
        #Helpdesk.user_class.has_many :helpdesk_tickets, :class_name => "Helpdesk::Ticket", :foreign_key => "assignee_id"
      end
    end
  end
end
