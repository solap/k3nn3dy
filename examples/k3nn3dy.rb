#!/usr/bin/env ruby
# Ruby style guide: https://github.com/bbatsov/ruby-style-guide

require 'turntabler'
load 'bot.rb'

# (0...ARGV.length).each do |i|
#   puts ARGV[i]
# end

EMAIL = ENV['EMAIL' + ARGV[0].upcase]        # 'xxxxx@xxxxx.com'
PASSWORD = ENV['PASSWORD' + ARGV[0].upcase]  # 'xxxxx'
ROOM = ENV['ROOM' + ARGV[0].upcase]          # 'xxxxxxxxxxxxxxxxxxxxxxxx'
NAME = ENV['NAME' + ARGV[0].upcase]         # 'xxxxxxxxxxxxxxxxxxxxxxxx'

EMAIL2 = ENV['EMAIL' + ARGV[1].upcase]        # 'xxxxx@xxxxx.com'
PASSWORD2 = ENV['PASSWORD' + ARGV[1].upcase]  # 'xxxxx'
ROOM2 = ENV['ROOM' + ARGV[1].upcase]          # 'xxxxxxxxxxxxxxxxxxxxxxxx'
NAME2 = ENV['NAME' + ARGV[1].upcase]          # 'xxxxxxxxxxxxxxxxxxxxxxxx'


# Create two Turntable accounts.

# Include the following in your environment (e.g. via .bash_profile)
#   export EMAILK="[email you used to set up Turntable]"
#   export PASSWORDK="[password here]"
#   export ROOMK="50de2e66aaa5cd1f9b6838f4" # d00gan room
#   export NAMEK="[current name in TT]" <==it's not critical that you get this right.

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
      my_bot.talk
      client.on :user_spoke do |message|
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


bot1 = new_bot EMAIL, PASSWORD, ROOM
bot2 = new_bot EMAIL2, PASSWORD2, ROOM


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

bot1.join
bot2.join

