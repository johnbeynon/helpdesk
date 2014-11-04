class RouteConstraintsTickets
  def matches?(request)
    Helpdesk.root_controller != 'faqs'
  end
end
