module Helpdesk
  class Subscriber < ActiveRecord::Base
    scope :confirmed,  where('confirmed = ? ',true)
    scope :unconfirmed,  where('confirmed = ? ',false)

    validates_presence_of :email

  end
end
