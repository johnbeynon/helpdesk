module Helpdesk
  module Admin::TicketsHelper
    def humanize_with_i18n(string, scope = [])
      I18n.t string, scope: scope, default: string.humanize
    end

    # The method prefix tells me that this should be in an object
    # But it doesn't belong in our model, does it?
    def tickets_statuses_for_select
      Helpdesk::Ticket::STATUSES.map { |s| [humanize_with_i18n(s[0].to_s,'helpdesk.tickets.statuses'),s[0]] }
    end
  end
end
