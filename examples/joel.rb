#!/usr/bin/env ruby
# Each time a a new song starts, vote it up
# Ruby style guide: https://github.com/bbatsov/ruby-style-guide
require 'turntabler'
load '~/projects/turntabler/examples/bot.rb'

ENVNAME = ARGV.first
ENVEMAIL = 'EMAIL' + ENVNAME.upcase         # 'xxxxx@xxxxx.com'
ENVPASSWORD = 'PASSWORD' + ENVNAME.upcase  # 'xxxxx'
ENVROOM = 'ROOM' + ENVNAME.upcase          # 'xxxxxxxxxxxxxxxxxxxxxxxx'



NAME = "kdkjeiijlaksd" if ARGV[0] == "k"
NAME = "kindredfacekick" if ARGV[0] == "k2"
NAME = "K3nn3dy" if ARGV[0] == "k3"

EMAIL = ENV[ENVEMAIL]
PASSWORD = ENV[ENVPASSWORD]
ROOM = ENV[ENVROOM]

TT.run(EMAIL, PASSWORD, :room => ROOM) do
  bot = Bot.new
  on :user_entered do |user|
    #user.become_fan
    room.say("#{bot.salutation} @#{user.name}!")
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
        room.become_dj
      when /^\/stepdown$/
        user.remove_as_dj
      when /^\/dive$/
        sender.remove_as_dj
        return dive(sender.name)
      when /^\/song$/
        room.say("title: #{room.current_song.title}")
        room.say("isrc: #{room.current_song.isrc}")
        room.say("source: #{room.current_song.source}")
        room.say("source_id: #{room.current_song.source_id}")
        room.say("current_song: #{room.current_song.inspect}")
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


