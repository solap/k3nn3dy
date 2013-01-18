  class Bot

    #change history to history
  @hug_history
  @whodaman_history
  @curse_history
  @hello_history
  @kiss_history
  @vomit_history
  @salutation_history


  def initialize
    @hug_history = ["First", "Second", "Third"]
    @whodaman_history = ["First", "Second", "Third"]
    @hug_history = ["First", "Second", "Third"]
    @whodaman_history = ["First", "Second", "Third"]
    @curse_history = ["First", "Second", "Third"]
    @hello_history = ["First", "Second", "Third"]
    @kiss_history = ["First", "Second", "Third"]
    @vomit_history = ["First", "Second", "Third"]
    @salutation_history = ["First", "Second", "Third"]
  end

  def hug
    @counter=false
    while @counter == false
      @response = hug_response
      @counter = true if !@hug_history.include?(@response)
    end
    @hug_history.pop
    @hug_history.unshift(@response)
    @response
  end

  def whodaman
    @counter=false
    while @counter == false
      @response = whodaman_response
      @counter = true if !@whodaman_history.include?(@response)
    end
    @whodaman_history.pop
    @whodaman_history.unshift(@response)
    @response
  end

  def curse
    @counter=false
    while @counter == false
      @response = curse_response
      @counter = true if !@curse_history.include?(@response)
    end
    @curse_history.pop
    @curse_history.unshift(@response)
    @response
  end
  def hello
    @counter=false
    while @counter == false
      @response = hello_response
      @counter = true if !@hello_history.include?(@response)
    end
    @hello_history.pop
    @hello_history.unshift(@response)
    @response
  end
  def kiss
    @counter=false
    while @counter == false
      @response = kiss_response
      @counter = true if !@kiss_history.include?(@response)
    end
    @kiss_history.pop
    @kiss_history.unshift(@response)
    @response
  end
  def vomit
    @counter=false
    while @counter == false
      @response = vomit_response
      @counter = true if !@vomit_history.include?(@response)
    end
    @vomit_history.pop
    @vomit_history.unshift(@response)
    @response
  end
  def salutation
    @counter=false
    while @counter == false
      @response = salutation_response
      @counter = true if !@salutation_history.include?(@response)
    end
    @salutation_history.pop
    @salutation_history.unshift(@response)
    @response
  end

  def hug_response
    [
      "Get off me, punk!",
      "Awwww, that's sweet.",
      "Um, your breath smells like dead stuff.",
      "I'm married, buddy. Well, I'm committed. Actually, I just don't like you."
    ].sample
  end

  def whodaman_response
    [
      "My main man, Joel!",
      "Manly Taddly!",
      "Scott of the sensuous beard.",
      "Queen Zlatina!",
      "Guilty Gil Lee",
      "Sky-in Bryan",
      "Chris the Bicep",
      "Pete Last Bro",
      "Steve is a TDD nazi."
    ].sample
  end
  def curse_response
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
  def hello_response
    [
      "Yo.",
      "What up?",
      "* ignores the noob *",
      "* looks across the room and finds love *",
      "Ijfi eizz shmieoo pcoi fur dee furmmeeing!!!"
    ].sample
  end
    def kiss_response
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
      "Wait, are you a guy?",
      "It's business time!",
      "Your grandma kisses so much better than that.",
      "It's getting hot in here.",
      "You kind of remind me of my dad.",
      "Hmmmmm. A little like kissing a coke bottle.",
      "That was, like, the BEST ... KISS ... EVAARRRRR...",
      "Don't kiss the bouncer, stud-muffin.",
      "Should someone of your gender be kissing someone of my gender?"
    ].sample
  end
  def vomit_response
    [
      "BLAAEEEACCCRGGGHH.",
      "* wipes the 'ol face *",
      "Can you take it outside next time?",
      "Someone please take away his glass.",
      "Someone must have played 40's rap."

    ].sample
  end
  def salutation_response
  [
    "What up,",
    "Howdy,",
    "Yo",
    "Yes,",
    "Welcome,"
  ].sample
  end
end
