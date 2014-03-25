class Helpdesk::NotificationsMailer < ActionMailer::Base

  layout 'mailer_layout'

  def ticket_created_notification(ticket)
    @ticket = ticket
    mail(:subject=>"#{Helpdesk.helpdesk_name} | #{ticket.subject}",
         :to => Helpdesk.email)
  end

  def ticket_created_confirmation(ticket)
    @ticket = ticket
    mail(:subject=>"#{Helpdesk.helpdesk_name} | #{ticket.subject}",
         :to => ticket.requester.email)
  end

  def comment_by_requester_notification(comment)
    @comment = comment
    mail(:subject=>"#{Helpdesk.helpdesk_name} | #{comment.ticket.subject}",
         :to => Helpdesk.email)
  end

  def comment_by_requester_confirmation(comment)
    @comment = comment
    mail(:subject=>"#{Helpdesk.helpdesk_name} | #{comment.ticket.subject}",
         :to => comment.ticket.requester.email)
  end


  def comment_by_helpdesk_notification(comment)
    @comment = comment
    mail(:subject=>"#{Helpdesk.helpdesk_name} | #{comment.ticket.subject}",
         :to => comment.ticket.requester.email)
  end

  def comment_by_helpdesk_confirmation(comment)
    @comment = comment
    mail(:subject=>"#{t('helpdesk.name')} | #{comment.ticket.subject}",
         :to => Helpdesk.email)
  end

end
