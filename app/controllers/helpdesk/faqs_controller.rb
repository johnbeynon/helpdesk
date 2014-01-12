module Helpdesk
  class FaqsController < Helpdesk::ApplicationController
    def index
      @faqs = Helpdesk::Faq.active
    end
  end
end
