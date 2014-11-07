module Helpdesk
  class FaqsController < Helpdesk::ApplicationController

    def search
      @faqs = Helpdesk::Faq.search(params[:search],params[:page])
    end

    def index
      @faqs = Helpdesk::Faq.active.roots
    end

    def show
      @faq = Helpdesk::Faq.active.find(params[:id])
    end
  end
end
