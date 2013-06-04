module Helpdesk
  class Subscriber < ActiveRecord::Base
    attr_accessible :confirmed, :email, :hashcode, :lang, :name
    scope :confirmed,  where('confirmed = ? ',true)
    scope :unconfirmed,  where('confirmed = ? ',false)

    validates_presence_of :email

  end
end
