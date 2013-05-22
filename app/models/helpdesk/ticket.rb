module Helpdesk
  class Ticket < ActiveRecord::Base
    attr_accessible :subject, :description
    attr_accessible :requester_id, :assignee_id, :status, :comments_attributes,:ticket_type_id


    belongs_to :requester, :class_name => Helpdesk.user_class.to_s
    belongs_to :assignee, :class_name => Helpdesk.user_class.to_s
    belongs_to :ticket_type, :class_name => Helpdesk::TicketType
    has_many :comments, :order => "helpdesk_comments.created_at DESC"

    scope :unassigned, where('assignee_id is null')

    validates_presence_of :description

    accepts_nested_attributes_for :comments

    state_machine :status, :initial => :nowy do

    end

    before_create :set_subject
    #after_create  :send_email

    def set_subject
      if self.created_at.nil?
        time = Time.now
      else
        time = self.created_at
      end

      new_subject = "#{sprintf '%02d',time.year-2000}#{sprintf '%02d',time.month}#{sprintf '%02d',time.day}"

      day_num = Sugestion.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).count+1
      new_subject += "-#{sprintf '%04d',day_num}: "
      self.subject = new_subject + subject.to_s
      self.subject.strip!
    end

    def send_email
      NotificationsMailer.sugestion_sent_to_us(self).deliver
      unless email.empty?
        NotificationsMailer.sugestion_sent(self).deliver
      end

    end

  end
end
