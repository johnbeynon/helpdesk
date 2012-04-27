require 'helpdesk'

::Helpdesk.setup do |config|
  # Class that represents the user 
  config.user_class = "User"

  # Require User to be present in order to access Helpdesk
  config.require_user = true
  
  # Base application sign in route name
  config.sign_in_url = 'sign_in_url' 
  
  # Ticket issue types
  config.issue_types = ['bug', 'change request', 'new feature']

  # Mail server to poll for incoming tickets
  config.mail_server = {
    server: 'pop.gmail.com',
    port: 995,
    ssl: true,
    username: ENV['helpdesk_mail_server_user'],
    password: ENV['helpdesk_mail_server_password']
  }
end
