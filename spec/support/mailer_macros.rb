module MailerMacros

  def last_email
    ActionMailer::Base.deliveries.last
  end

  def last_email_address
    last_email.to.join
  end

  def reset_email
    ActionMailer::Base.deliveries = []
  end

  def reset_with_delayed_job_deliveries
    ActionMailer::Base.deliveries = []
  end

  def all_emails
    ActionMailer::Base.deliveries
  end

  def all_emails_sent_count
    ActionMailer::Base.deliveries.count
  end

  def all_email_addresses
    all_emails.map(&:to).flatten
  end

  def all_email_subjects
    all_emails.map(&:subject).flatten
  end

end
