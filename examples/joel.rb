#!/usr/bin/env ruby
# Each time a a new song starts, vote it up
# Ruby style guide: https://github.com/bbatsov/ruby-style-guide
require 'turntabler'
load '~/projects/turntabler/examples/bot.rb'

# To run this, type the following at your command line:
#   ruby joel.rb [bot_prefix]

# [bot_prefix] is an enrionrment variable you can tie to a turntable account.

#


ENVVAR = ARGV.first
ENVEMAIL = 'EMAIL' + ENVVAR.upcase        # 'xxxxx@xxxxx.com'
ENVPASSWORD = 'PASSWORD' + ENVVAR.upcase  # 'xxxxx'
ENVROOM = 'ROOM' + ENVVAR.upcase          # 'xxxxxxxxxxxxxxxxxxxxxxxx'
ENVNAME = 'NAME' + ENVVAR.upcase          # 'xxxxxxxxxxxxxxxxxxxxxxxx'

EMAIL = ENV[ENVEMAIL]
PASSWORD = ENV[ENVPASSWORD]
ROOM = ENV[ENVROOM]
NAME = ENV[ENVNAME]

puts EMAIL
puts PASSWORD
puts ROOM
puts ENVNAME
puts NAME

TT.run(EMAIL, PASSWORD, :room => ROOM) do
  bot = Bot.new
  on :user_entered do |user|
    #user.become_fan
    puts "IN USER ENTERED. ROOM: #{room.name}"
    prefix = user.name[0] == "@" ? '' : '@'
    room.say("#{bot.salutation} #{prefix}#{user.name}!")
  end
  on :song_started do |song|
    song.vote
  end
  on :user_spoke do |message|
    room.say yadda(message.content, message.sender, bot) if message.sender.id != user.id
  end

  def yadda(incoming, sender, bot)
    case incoming
      when /^\/hello$/
        room.say(bot.hello)
      when /^\/curse$/
        room.say(bot.curse)
      when /^\/whodaman$/
        room.say(bot.whodaman)
      when /^\/kiss$/
        room.say(bot.kiss)
      when /^\/hug$/
        room.say(bot.hug)
      when /^\/stepup$/
        room.become_dj # need error checking here
      when /^\/stepdown$/
        user.remove_as_dj # need error checking here
      when /^\/dive$/
        sender.remove_as_dj # need error checking here.
        return dive(sender.name)
      when /^\/song$/
        room.say("title: #{room.current_song.title}")
        # room.say("isrc: #{room.current_song.isrc}")
        # room.say("source: #{room.current_song.source}")
        # room.say("source_id: #{room.current_song.source_id}")
        # room.say("current_song: #{room.current_song.inspect}")
      when /^\/artist$/
        room.say(room.current_song.artist)
      when /^\/album$/
        room.say(room.current_song.album)
      when /^\/skip$/
        room.current_song.skip
      when /^\/commands$/
        room.say("#{NAME} accepts the following commands: /album, /song, /artist, /hug, /kiss, /whodaman, /curse, and /hello. If #{NAME} is in the audience, you can command #{NAME} to /stepup. If at the table, /stepdown. If you are at the table, you can /dive.")
        #room.say("test")
      when /^\/vomit$/
        return vomit

      # else
      #   room.say("wtf does that mean?") if message.content
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


