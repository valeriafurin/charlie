# # Download the twilio-ruby library from twilio.com/docs/libraries/ruby
# require "twilio-ruby"

# account_sid = ENV["TWILIO_ACCOUNT_SID"]
# auth_token = ENV["TWILIO_AUTH_TOKEN"]
# client = Twilio::REST::Client.new(account_sid, auth_token)

# from = "+12512913707" # Your Twilio number
# to = "+491715544394" # Your mobile phone number

# client.messages.create(
#   from: from,
#   to: to,
#   body: "Hey there, this is Twilio!",
# )
