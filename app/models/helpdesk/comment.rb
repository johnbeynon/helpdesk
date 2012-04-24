module Helpdesk
  class Comment < ActiveRecord::Base
    attr_accessible :author_id, :comment, :public, :ticket_id
    belongs_to :author, :class_name => Helpdesk.user_class.to_s
    belongs_to :ticket
  end
end
