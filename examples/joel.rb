#!/usr/bin/env ruby
# Each time a a new song starts, vote it up
# Ruby style guide: https://github.com/bbatsov/ruby-style-guide
require 'turntabler'
# load '~/projects/turntabler/examples/bot.rb'
load 'bot.rb'


# Create a Turntable account.

# Include the following in your environment (e.g. via .bash_profile)
#   export EMAILK="[email you used to set up Turntable]"
#   export PASSWORDK="[password here]"
#   export ROOMK="50de2e66aaa5cd1f9b6838f4" # d00gan room
#   export NAMEK="[current name in TT]" <==it's not critical that you get this right.

# To run the bot, type the following at your command line in the turntabler/examples directory:
#   ruby joel.rb k

ENVVAR = ARGV.first
ENVEMAIL = 'EMAIL' + ENVVAR.upcase        # 'xxxxx@xxxxx.com'
ENVPASSWORD = 'PASSWORD' + ENVVAR.upcase  # 'xxxxx'
ENVROOM = 'ROOM' + ENVVAR.upcase          # 'xxxxxxxxxxxxxxxxxxxxxxxx'
ENVNAME = 'NAME' + ENVVAR.upcase          # 'xxxxxxxxxxxxxxxxxxxxxxxx'

EMAIL = ENV[ENVEMAIL]
PASSWORD = ENV[ENVPASSWORD]
ROOM = ENV[ENVROOM]
NAME = ENV[ENVNAME]

#client = TT::Client.new("joel@dehlin.org", "password", :room => "50de2e66aaa5cd1f9b6838f4")

TT.run(EMAIL, PASSWORD, :room => ROOM) do
  bot = Bot.new
  on :user_entered do |user|
    #user.become_fan
    prefix = user.name[0] == "@" ? '' : '@'
    room.say("#{bot.salutation} #{prefix}#{user.name}!")
  end
  on :song_started do |song|
    song.vote
  end
  # fix loop when two bots are both talking
  on :user_spoke do |message|
    room.say yadda(message.content, message.sender, bot) if message.sender.id != user.id
  end

  end
  def dive user
    return [
      "#{user} lays it out!",
      "BAM! #{user} loses a tooth in the mosh pit.",
      "#{user} excuses himself for a quick bio break.",
      "Screams rise as #{user} catapults into the crowd!"
    ].sample
  end
end


