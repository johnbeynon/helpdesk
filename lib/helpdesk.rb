require "helpdesk/engine"

module Helpdesk
  mattr_accessor :require_user
  @@require_user = false

  mattr_accessor :sign_in_url

  mattr_accessor :user_class

  mattr_accessor :display_user

  mattr_accessor :issue_types
  
  mattr_accessor :mail_server
  
  def self.setup
    yield self
  end

  def self.user_class
    if @@user_class.is_a?(String)
      @@user_class.constantize
    end
  end

end
