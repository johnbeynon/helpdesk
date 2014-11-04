require "helpdesk/engine"

module Helpdesk
  mattr_accessor :require_user
  @@require_user = false

  mattr_accessor :sign_in_url

  mattr_accessor :user_class

  mattr_accessor :display_user

  mattr_accessor :display_user_uniq_info

  mattr_accessor :mail_server

  mattr_accessor :email

  mattr_accessor :send_confirmation_emails
  @@send_confirmation_emails = false

  mattr_accessor :site_name

  mattr_accessor :site_address

  mattr_accessor :helpdesk_name
  @@helpdesk_name = "Helpdesk"

  mattr_accessor :root_controller
  @@root_controller = "faqs"

  def self.setup
    yield self
  end

  def self.user_class
    if @@user_class.is_a?(String)
      @@user_class.constantize
    end
  end

end
