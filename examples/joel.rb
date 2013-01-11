#!/usr/bin/env ruby
# Each time a a new song starts, vote it up
require 'turntabler'

EMAIL = ENV['EMAIL']        # 'xxxxx@xxxxx.com'
PASSWORD = ENV['PASSWORD']  # 'xxxxx'
ROOM = ENV['ROOM']          # 'xxxxxxxxxxxxxxxxxxxxxxxx'

TT.run(EMAIL, PASSWORD, :room => ROOM) do
  on :user_entered do |user|
    #user.become_fan
    room.say("#{salutation} @#{user.name}!")
  end
  on :song_started do |song|
    song.vote
  end
  on :user_spoke do |message|
    room.say yadda(message.content, message.sender) if message.sender.id != user.id
  end
  def yadda(incoming, sender)
    case incoming
      when /^\/hello$/
        return hello
      when /^\/curse$/
        return curse
      when /^\/whodaman$/
        return whodaman
      when /^\/kiss$/
        return kiss
      when /^\/hug$/
        return hug
      when /^\/stepup$/
        room.become_dj
      when /^\/stepdown$/
        user.remove_as_dj
      when /^\/dive$/
        sender.remove_as_dj
        return dive(sender.name)
      when /^\/song$/
        room.say(room.current_song.title)
      when /^\/artist$/
        room.say(room.current_song.artist)
      when /^\/album$/
        room.say(room.current_song.album)
      when /^\/skip$/
        song.skip



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
# unshift
# pop
  def salutation
    [
      "What up,",
      "Howdy,",
      "Yo",
      "Yes,",
      "Welcome,"
    ].sample
  end

  def hug
    [
      "Get off me, punk!",
      "Awwww, that's sweet.",
      "Um, your breath smells like dead stuff.",
      "I'm married, buddy. Well, I'm committed. Actually, I just don't like you."
    ].sample
  end



  def whodaman
    [
      "My main man, Joel!",
      "Manly Taddly!",
      "Scott of the sensuous beard.",
      "Queen Zlatina!",
      "Guilty Gil Lee",
      "Sky-in Bryan",
      "Chris the Bicep",
      "Pete Last Bro"
    ].sample
  end

  def curse
    [
      "Damn you, Tadd!",
      "Fetch!",
      "Flip!",
      "Freak!",
      "Crud!",
      "Scrud!",
      "Dang it!",
      "Shiz.",
      "Shite.",
      "Gol durn it!",
      "For the love of Pete!",
      "Filthin foul, filth, filth, foul!!"
    ].sample
  end

  def hello
    [
      "Yo.",
      "What up?",
      "* ignores the noob *",
      "* looks across the room and finds love *",
      "Ijfi eizz shmieoo pcoi fur dee furmmeeing!!!"
    ].sample
  end

  def kiss
    [
      "I WILL slap you!",
      "<swoon>",
      "I will END you!",
      "Fresh!!",
      "No tongue please.",
      "<swoon>",
      "You make my heart go bang, bang, bang!",
      "You kiss like my brother!",
      "Your lips taste like rainbows!",
      "I saw stars...did you see stars?",
      "You need a little more practice with a real girl before you try that again.",
      "You realize I'm a guy, right?",
      "It's business time!",
      "Your grandma kisses so much better than that.",
      "It's getting hot in here.",
      "You kind of remind me of my dad.",
      "Hmmmmm. A little like kissing a coke bottle.",
      "That was, like, the BEST ... KISS ... EVAARRRRR...",
      "Don't kiss the bouncer, stud-muffin."
    ].sample
  end

end
