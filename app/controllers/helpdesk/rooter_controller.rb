module Helpdesk
  class RooterController < Helpdesk::ApplicationController
    def index
      case Helpdesk.root_controller
      when 'faqs'
        redirect_to faqs_url
      when 'tickets'
        redirect_to tickets_url
      when 'subscribers'
        redirect_to subscribers_url
      else
        redirect_to faqs_url
      end
    end
  end
end
