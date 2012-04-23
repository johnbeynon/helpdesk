require 'rails'
require 'simple_form'
require 'state_machine'
require 'bootstrap-sass'

module Helpdesk
  class Engine < ::Rails::Engine
    isolate_namespace Helpdesk

    initializer "Helpdesk precompile hook" do |app|
      app.config.assets.precompile += ['helpdesk/admin.css']
    end

    config.to_prepare do
      if Helpdesk.user_class
        Helpdesk.user_class.has_many :helpdesk_tickets, :class_name => "Helpdesk::Ticket", :foreign_key => "requester_id"
        #Helpdesk.user_class.has_many :helpdesk_tickets, :class_name => "Helpdesk::Ticket", :foreign_key => "assignee_id"
      end
    end
  end
end
