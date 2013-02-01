
@kiss_history = ["First", "Second", "Third"]

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

for i in 0..5 do
  puts @kiss_history.inspect
  @kiss_history.pop #don't think this is working the way i think it is. was assuming it was taking 1st element, not third.
  puts @kiss_history.inspect
  @kiss_history.unshift(@kiss_responses.sample)
  puts @kiss_history.inspect
  puts "***"
end