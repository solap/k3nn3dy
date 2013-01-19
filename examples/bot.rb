  class Bot

    #change history to history
  @hug_history
  @whodaman_history
  @curse_history
  @hello_history
  @kiss_history
  @vomit_history
  @salutation_history
  @hug_responses
  @whodaman_responses
  @curse_responses
  @hello_responses
  @kiss_responses
  @vomit_responses
  @salutation_responses



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
    ]
    @vomit_responses =
    [
      "BLAAEEEACCCRGGGHH.",
      "* wipes the 'ol face *",
      "Can you take it outside next time?",
      "Someone please take away his glass.",
      "Someone must have played 40's rap."
    ]
    @salutation_responses =
    [
      "What up,",
      "Howdy,",
      "Yo",
      "Yes,",
      "Welcome,"
    ]
  end


  def do_action responses, history
    @counter=false
    while @counter == false
      @response = responses.sample
      @counter = true if !history.include?(@response)
    end
    history.pop
    history.unshift(@response)
    @response
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

end
