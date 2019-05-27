class MailSenderJob < ApplicationJob
  queue_as :default

  def perform(phone_number, link)
    SendmailMailer.new.send(phone_number, link)
  end
end
