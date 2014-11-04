require 'helpdesk'

::Helpdesk.setup do |config|
  # Class that represents the user/admin
  config.user_class = "User"

  # Method usign to display information about user for users
  config.display_user = "name"

  # Method usign to display information about user for admins (name+id?)
  config.display_user_uniq_info = "email"

  # Require User to be present in order to access Helpdesk
  config.require_user = true

  # Base application sign in route name
  config.sign_in_url = 'new_user_session_path'

  # Helpdesk email for notification
  config.email = 'helpdesk@example.com'

  # Send confirmation emails
  config.send_confirmation_emails = true

  # Site name in email footer
  config.site_name = "Example Helpdesk Team"

  # Site address in email footer
  config.site_address = "www.example.com"

  # Helpdesk title
  config.helpdesk_name = "Example Helpdesk"

  # Helpdesk root controller for users: faqs or tickets
  config.root_controller = 'faqs'

end
