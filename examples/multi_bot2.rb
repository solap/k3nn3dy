#!/usr/bin/env ruby
# Each time a a new song starts, vote it up
# Ruby style guide: https://github.com/bbatsov/ruby-style-guide
require 'turntabler'
load '~/projects/turntabler/examples/bot.rb'

# Create a Turntable account.

# Include the following in your environment (e.g. via .bash_profile)
#   export EMAILK="[email you used to set up Turntable]"
#   export PASSWORDK="[password here]"
#   export ROOMK="50de2e66aaa5cd1f9b6838f4" # d00gan room
#   export NAMEK="[current name in TT]" <==it's not critical that you get this right.

# To run the bot, type the following at your command line in the turntabler/examples directory:
#   ruby joel.rb k

counter = Thread.new do
  TT.run do
    client = TT::Client.new("joel@dehlin.org", "password", :room => "50de2e66aaa5cd1f9b6838f4")
    fred = Bot.new(client)
    fred.talk

    client.on :user_spoke do |message|
      puts message.content
      fred.tell(message.content, message.sender) if message.content.split[0] == client.user.name
      # client.room.say "what did you say?" if message.sender.id != client.user.id
    end
    client.on :user_entered do |user|
      fred.say_hello user
    end
    client.on :song_started do |song|
      fred.bop song
    end
  end
end

counter2 = Thread.new do
  TT.run do
    client2 = TT::Client.new("joel.dehlin@gmail.com", "was999up", :room => "50de2e66aaa5cd1f9b6838f4")
    fred2 = Bot.new(client2)
    fred2.talk

    # client.on :user_spoke do |message|
    #   client.room.say "what did you say?" if message.sender.id != client.user.id
    # end

    client2.on :user_entered do |user|
      fred2.say_hello user
    end
    client2.on :song_started do |song|
      fred2.bop song
    end
    client2.on :user_spoke do |message|
      puts message.content
      fred2.tell(message.content, message.sender) if message.content.split[0] == client2.user.name
      # client.room.say "what did you say?" if message.sender.id != client.user.id
    end
  end
end

counter.join
counter2.join

