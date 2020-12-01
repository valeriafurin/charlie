# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require "twilio-ruby"

account_sid = "ACefb69d85b304fafeb67f04eb617e8416"
auth_token = "97eaf829884c41cd267a344dc143a655"
client = Twilio::REST::Client.new(account_sid, auth_token)

from = "+12512913707" # Your Twilio number
to = "+491715544394" # Your mobile phone number

client.messages.create(
  from: from,
  to: to,
  body: "Hey friend, this is Twilio!",
)
