#!/usr/bin/env ruby
# Ruby style guide: https://github.com/bbatsov/ruby-style-guide

require 'turntabler'
load 'bot.rb'

ARGV.each_with_index do |string, index|
  if index==0
    ROOM = ENV['ROOM' + ARGV[0].upcase]          # 'xxxxxxxxxxxxxxxxxxxxxxxx'
  else
    str = "EMAIL#{index} = ENV['EMAIL' + ARGV[index].upcase]"
    eval(str)
    str = "PASSWORD#{index} = ENV['PASSWORD' + ARGV[index].upcase]"
    eval(str)
    str = "NAME#{index} = ENV['NAME' + ARGV[index].upcase]"
    eval(str)
  end
end

# Create Turntable accounts.

# Include the following in your environment (e.g. via .bash_profile)
#   export EMAILK1="[email you used to set up Turntable]"
#   export PASSWORDK1="[password here]"
#   export ROOMK1="50de2e66aaa5cd1f9b6838f4" # d00gan room
#   export NAMEK1="[current name in TT]" <==it's not critical that you get this right.

#   export EMAILK2="[email you used to set up Turntable]"
#   export PASSWORDK2="[password here]"
#   export ROOMK2="50de2e66aaa5cd1f9b6838f4" # d00gan room
#   export NAMEK2="[current name in TT]" <==it's not critical that you get this right.


# To run the bot, type the following at your command line in the turntabler directory:
#   ruby k3nn3dy.rb k k2

def new_bot email, password, room
  counter = Thread.new do
    TT.run do
      client = TT::Client.new(email, password, room: room)
      my_bot = Bot.new(client)
      client.on :user_spoke do |message|
        puts "**** in :user_spoke message: #{message.content}"
        my_bot.tell(message.content, message.sender) if message.content.split[0] == client.user.name
      end
      client.on :user_entered do |user|
        my_bot.say_hello user
      end
      client.on :song_started do |song|
        my_bot.bop song
      end
    end
  end
end

bot1 = new_bot EMAIL1, PASSWORD1, ROOM
bot2 = new_bot EMAIL2, PASSWORD2, ROOM
bot3 = new_bot EMAIL3, PASSWORD3, ROOM
bot4 = new_bot EMAIL4, PASSWORD4, ROOM
bot1.join
bot2.join
bot3.join
bot4.join

# counter = Thread.new do
#   TT.run do
#     client = TT::Client.new(EMAIL, PASSWORD, :room => ROOM)
#     fred = Bot.new(client)
#     fred.talk
#     client.on :user_spoke do |message|
#       puts message.content
#       fred.tell(message.content, message.sender) if message.content.split[0] == client.user.name
#     end
#     client.on :user_entered do |user|
#       fred.say_hello user
#     end
#     client.on :song_started do |song|
#       fred.bop song
#     end
#   end
# end

# counter2 = Thread.new do
#   TT.run do
#     client2 = TT::Client.new(EMAIL2, PASSWORD2, :room => ROOM2)
#     fred2 = Bot.new(client2)
#     fred2.talk
#     client2.on :user_entered do |user|
#       fred2.say_hello user
#     end
#     client2.on :song_started do |song|
#       fred2.bop song
#     end
#     client2.on :user_spoke do |message|
#       puts message.content
#       fred2.tell(message.content, message.sender) if message.content.split[0] == client2.user.name
#     end
#   end
# end


