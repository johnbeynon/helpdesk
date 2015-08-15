module Helpdesk
  class Subscriber < ActiveRecord::Base
    scope :confirmed,  ->{ where('confirmed = ? ',true)}
    scope :unconfirmed, ->{ where('confirmed = ? ',false)}

    validates_presence_of :email
    validates_uniqueness_of :email

    before_create :generate_token
    after_create :send_activate_subscription

    def generate_token
      self.hashcode = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Helpdesk::Subscriber.where(hashcode: random_token).exists?
      end
    end

    def send_activate_subscription
      Helpdesk::NotificationsMailer.send_activate_subscription(self).deliver
    end


  end
end
