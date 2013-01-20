require 'turntabler'
load 'bot.rb'

TT.run do
  client = TT::Client.new("joel@dehlin.org", "password", :room => "50de2e66aaa5cd1f9b6838f4")
  client2 = TT::Client.new("joel.dehlin@gmail.com", "was999up", :room => "50de2e66aaa5cd1f9b6838f4")
  client.on :user_entered do
    # user.become_fan
    # prefix = user.name[0] == "@" ? '' : '@'
    # room.say("#{bot.salutation} #{prefix}#{user.name}!")
    client.room.say("what ddd up?")
  end

  #client.room.become_dj
end