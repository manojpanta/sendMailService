require 'twilio-ruby'
class Api::V1::SendmailController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    body = JSON.parse(request.body.read)
    if send_mail(body["phone_number"], body["link"])
    else
      flash[:error] = "Mail could not be sent!!"
    end
  end

  private
  def send_mail(phone_number, link)
    MailSenderJob.perform_later(phone_number, link)
  end
end
