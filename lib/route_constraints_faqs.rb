class RouteConstraintsFaqs
  def matches?(request)
    Helpdesk.root_controller == 'faqs'
  end
end
