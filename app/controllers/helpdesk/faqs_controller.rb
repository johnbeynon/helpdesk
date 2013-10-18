module Helpdesk
  class FaqsController < ApplicationController
    def index
      @faqs = Helpdesk::Faq.active
    end
  end
end
