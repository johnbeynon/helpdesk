module Helpdesk
  class Ticket < ActiveRecord::Base
    attr_accessible :description, :requester_id, :assignee_id, :subject, :status, :issue_type, :comments_attributes
    belongs_to :requester, :class_name => Helpdesk.user_class.to_s
    belongs_to :assignee, :class_name => Helpdesk.user_class.to_s
    has_many :comments, :order => "helpdesk_comments.created_at DESC"

    scope :unassigned, where('assignee_id is null')

    validates_presence_of :description

    accepts_nested_attributes_for :comments

    state_machine :status, :initial => :new do

    end
  end
end
