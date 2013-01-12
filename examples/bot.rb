class Bot

  @hug_counter
  @hug_exceptions

  def initialize
    @hug_counter=0
    @hug_exceptions = ["First", "Second", "Third"]
  end

  def hug
    @counter=false
    while @counter == false
      @response = hug_response
      @counter = true if !@hug_exceptions.include?(@response)
    end
    @hug_exceptions.pop
    @hug_exceptions.unshift(@response)
    puts @hug_exceptions
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
end
