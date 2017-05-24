require 'twilio-ruby'

class TwilioSender

  def self.send(to = '+13038877673')
    account_sid = ENV['twilio_sid'] # Your Account SID from www.twilio.com/console
    auth_token = ENV['twilio_auth_token']
    confirmation_code = CodeGenerator.generate_code
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(:body => "#{confirmation_code}",
    :to => to,    # Replace with your phone number
    :from => "+17205731786")  # Replace with your Twilio number
    confirmation_code
  end
end
