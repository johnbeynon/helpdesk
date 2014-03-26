module Helpdesk
  class Faq < ActiveRecord::Base
    translates :title, :text
    accepts_nested_attributes_for :translations

    default_scope order('position ASC').includes(:translations)

    scope :active,  -> {where(active:  true)}
    scope :inactive,  -> {where(active: false)}
  end
end
