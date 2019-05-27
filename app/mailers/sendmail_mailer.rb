class SendmailMailer < ApplicationMailer
  def send(phone_number, link)
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    sleep(20)
    @client.messages.create(body: "Chekout this link: #{link} ",
                            to: phone_number,
                            from: "+12063396159")
  end
end
