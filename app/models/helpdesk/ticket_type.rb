module Helpdesk
  class TicketType < ActiveRecord::Base
    translates :title
    accepts_nested_attributes_for :translations
    #attr_accessible :active, :position,:title,:translations_attributes,:tr_class

    default_scope ->{order('position ASC')}

    scope :active,  -> {where(:active,  true)}
    scope :inactive,  -> {where(:active, false)}

  end
end
