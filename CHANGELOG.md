# master

* Fix Modlist example not sending messages to the room

## 0.1.4 / 2012-01-08

* Fix Bop / ChatBot / Switch examples not working
* Fix Message#sender not set properly on user_spoke events
* Fix Client#room not being reset when leaving a room
* Fix roomid / section not being specify consistently in room APIs

## 0.1.3 / 2012-12-25

* Fix references from Message#text to Message#content in examples

## 0.1.2 / 2012-12-01

* Fix song searches being allowed when the user isn't in a room
* Allow title / artist / duration to be explicitly specified in song searches

## 0.1.1 / 2012-11-27

* Fix gemspec filename

## 0.1.0 / 2012-11-27

* Add :reconnected event for hooking in logic when a client reconnects
* Gracefully handle error cases where APIs are called from a root fiber
* Don't re-define the TT constant if it's already been defined
* Add Turntabler::Client#user_by_name for looking up users by their name instead of id
* Allow authentication via user ids / auth tokens if a password is unavailable
* Authenticate using emails / passwords instead of user ids / auth tokens
* Fix exceptions in callbacks not causing one-time callbacks to be unregistered
* Only catch StandardError, not Exception, in Turntabler#run
* Fix song votes being tracked with empty user ids
* Fix the current dj's points not getting updated on song_voted events
* Fix song_ended event never getting fired
* Fix laptop names not being able to be updated

## 0.0.1 / 2012-11-20

* Initial revision
