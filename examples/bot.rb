class Bot

  def initialize(client)
    @fred = client
    @hug_history = ["First", "Second", "Third"]
    @whodaman_history = ["First", "Second", "Third"]
    @hug_history = ["First", "Second", "Third"]
    @whodaman_history = ["First", "Second", "Third"]
    @curse_history = ["First", "Second", "Third"]
    @hello_history = ["First", "Second", "Third"]
    @kiss_history = ["First", "Second", "Third"]
    @vomit_history = ["First", "Second", "Third"]
    @salutation_history = ["First", "Second", "Third"]
    @hug_responses =
      [
        "Get off me, punk!",
        "Awwww, that's sweet.",
        "Um, your breath smells like dead stuff.",
        "I'm married, buddy. Well, I'm committed. Actually, I just don't like you."
      ]
    @whodaman_responses =
    [
      "Ben der Jammin",
      "My main man, Joel!",
      "Manly Taddly!",
      "Scott of the sensuous beard.",
      "Queen Zlatina!",
      "Guilty Gil Lee",
      "Sky-in Bryan",
      "Chris the Bicep",
      "Pete Last Bro",
      "Steve is a TDD nazi."
    ]
    @curse_responses =
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
    ]
    @hello_responses =
    [
      "Yo.",
      "What up?",
      "* ignores the noob *",
      "* looks across the room and finds love *",
      "Ijfi eizz shmieoo pcoi fur dee furmmeeing!!!"
    ]
    @kiss_responses =
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
      "You need a little more practice with a real person before you try that again.",
      "Wait, are you a guy?",
      "It's business time!",
      "Your grandma kisses so much better than that.",
      "It's getting hot in here.",
      "You kind of remind me of my dad.",
      "Hmmmmm. A little like kissing a coke bottle.",
      "That was, like, the BEST ... KISS ... EVAARRRRR...",
      "Don't kiss the bouncer, stud-muffin.",
      "Should someone of your gender be kissing someone of my gender?"
    ]
    @vomit_responses =
    [
      "BLAAEEEACCCRGGGHH.",
      "* wipes the 'ol face *",
      "Can you take it outside next time?",
      "Someone please take away his glass.",
      "Someone must have played 40's rap.",
      "Ick"
    ]
    @salutation_responses =
    [
      "What up,",
      "howdy,",
      "yo",
      "Welcome,",
      "hey"
    ]
  end
  def dive user
    return [
      "#{user} lays it out!",
      "BAM! #{user} loses a tooth in the mosh pit.",
      "#{user} excuses himself for a quick bio break.",
      "Screams rise as #{user} catapults into the crowd!"
    ].sample
  end

  def do_action responses, history
    @counter=false
    while @counter == false
      @response = responses.sample
      @counter = true if !history.include?(@response)
    end
    history.pop #don't think this is working the way i think it is. was assuming it was taking 1st element, not third.
    history.unshift(@response)
    @response
  end
  def say_hello user
    sleep 1
    prefix = user.name[0] == "@" ? '' : '@'
    @fred.room.say "#{salutation} #{prefix}#{user.name}!"
  end
  def hug
    do_action @hug_responses, @hug_history
  end
  def whodaman
    do_action @whodaman_responses, @whodaman_history
  end
  def curse
    do_action @curse_responses, @curse_history
  end
  def hello
    do_action @hello_responses, @hello_history
  end
  def kiss
    do_action @kiss_responses, @kiss_history
  end
  def vomit
    do_action @vomit_responses, @vomit_history
  end
  def salutation
    do_action @salutation_responses, @salutation_history
  end
  def bop song
    song.vote if !song.nil? #fix the 'no song playing' failure
  end
  def tell string, requestor

    addressee = string.split[0]
    message = string.gsub(string.split(" ")[0] + " ", "")
    yadda(message, requestor)

  end

  def yadda(incoming, sender)
    case incoming
      when "hello"
        @fred.room.say(hello)
      when "curse"
        @fred.room.say(curse)
      when "whodaman"
        @fred.room.say(whodaman)
      when "kiss"
        @fred.room.say(kiss)
      when "hug"
        @fred.room.say(hug)
      when "stepup"
        @fred.room.become_dj # need error checking here
      when "stepdown"
        @fred.user.remove_as_dj # need error checking here
      when "dive"
        sender.remove_as_dj # need error checking here.
        @fred.room.say(dive(sender.name))
      when "song"
        @fred.room.say("title: #{@fred.room.current_song.title}")
        # room.say("isrc: #{room.current_song.isrc}")
        # room.say("source: #{room.current_song.source}")
        # room.say("source_id: #{room.current_song.source_id}")
        # room.say("current_song: #{room.current_song.inspect}")
      when "artist"
        @fred.room.say(@fred.room.current_song.artist)
      when "album"
        @fred.room.say(@fred.room.current_song.album)
      when "skip"
        @fred.room.current_song.skip #check if this bot is playing the current song.
      when "commands"
        @fred.room.say("I accept the following commands: album, song, artist, hug, kiss, whodaman, curse, and hello. If I'm in the audience, you can command me to stepup. If at the table, stepdown. If you are at the table, you can ask me to help you dive.")
      when "vomit"
        @fred.room.say(vomit)
      # else
      #   room.say("wtf does that mean?") if message.content
      end
    end
end
