module Helpdesk
  class Ticket < ActiveRecord::Base


    STATUSES = [
      [ :new,        'label-primary',3],
      [ :open,        'label-warning',2],
      [ :waiting,     'label-info',2],
      [ :solved,      'label-success',0],
      [ :not_fixable, 'label-default',-1],
      [ :unreachable, 'label-default',-1],
      [ :bug,         'label-default',-1]
    ]
    STATUS_BY_KEY = Hash[*STATUSES.map { |i| [i[0], i[1]] }.flatten]
    STATUS_CLASS_BY_KEY= Hash[*STATUSES.map { |i| [i[0], i[1]] }.flatten]
    STATUS_STATUS_BY_KEY= Hash[*STATUSES.map { |i| [i[0], i[2]] }.flatten]
    OPEN_STATUSES_KEYS =  STATUSES.map { |i| (i[2]>0 ? i[0] : nil)}.compact


    belongs_to :requester, :class_name => Helpdesk.user_class.to_s
    belongs_to :assignee, :class_name => Helpdesk.user_class.to_s
    belongs_to :ticket_type, :class_name => Helpdesk::TicketType
    has_many :comments, -> {order("created_at DESC")},:dependent => :destroy


    scope :active,   -> {where('status IN (?) ',OPEN_STATUSES_KEYS)}
    scope :unassigned,   -> {where('status IN (?) ',OPEN_STATUSES_KEYS).where('assignee_id is null')}
    scope :closed, -> { where('status NOT IN (?)',OPEN_STATUSES_KEYS)}
    default_scope -> { includes(:comments=>[:author])
    .includes(:requester)
    .includes(:assignee)
    .includes(:ticket_type)
    .order('id DESC')}

    validates_presence_of :description,:requester,:ticket_type_id

    accepts_nested_attributes_for :comments,:reject_if => lambda { |a| a[:comment].blank? }


    before_create :set_subject
    before_create :set_status
    after_create  :send_email

    def set_status
      if self.status.blank?
        self.status = :new
      end
    end

    def set_subject
      if self.created_at.nil?
        time = Time.now
      else
        time = self.created_at
      end

      new_subject = "#{sprintf '%02d',time.year-2000}#{sprintf '%02d',time.month}#{sprintf '%02d',time.day}"

      day_num = Helpdesk::Ticket.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).count+1
      new_subject += "-#{sprintf '%04d',day_num}: "
      self.subject = new_subject + subject.to_s
      self.subject.strip!
    end

    def send_email
      Helpdesk::NotificationsMailer.ticket_created_notification(self).deliver
      unless requester.email.empty?
        Helpdesk::NotificationsMailer.ticket_created_confirmation(self).deliver if Helpdesk.send_confirmation_emails
      end
    end

    def open?
      if self.status.blank? || STATUS_STATUS_BY_KEY[self.status.to_sym] > 0
        true
      else
        false
      end
    end

  end
end
