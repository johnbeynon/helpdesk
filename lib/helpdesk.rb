require "helpdesk/engine"

module Helpdesk
  mattr_accessor :require_user
  @@require_user = false

  mattr_accessor :sign_in_url

  mattr_accessor :user_class

  mattr_accessor :issue_types
  
  def self.setup
    yield self
  end

  def self.user_class
    @@user_class.constantize
  end

end
