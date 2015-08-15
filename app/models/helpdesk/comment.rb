module Helpdesk
  class Comment < ActiveRecord::Base
    belongs_to :author, :class_name => Helpdesk.user_class.to_s
    belongs_to :ticket

    default_scope -> {includes(:author).order('id ASC')}
    scope :pub,  -> { where(public: true)}

    after_create :send_email
    after_create :check_reopen

    def check_reopen
      if ticket.requester == author
        ticket.update_column(:status ,:waiting)
      end
    end


    def send_email
      if self.public?
        if ticket.requester == author
          Helpdesk::NotificationsMailer.comment_by_requester_notification(self).deliver if ticket.requester
          Helpdesk::NotificationsMailer.comment_by_requester_confirmation(self).deliver if Helpdesk.send_confirmation_emails
        else
          Helpdesk::NotificationsMailer.comment_by_helpdesk_notification(self).deliver if ticket.requester
          Helpdesk::NotificationsMailer.comment_by_helpdesk_confirmation(self).deliver if Helpdesk.send_confirmation_emails
        end
      end
    end
  end
end
