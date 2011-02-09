#Memetalk

A simple gem that combines the power of [a fork](http://github.com/txus/memegenerator) of Dr Brain's [meme generator](http://github.com/drbrain/meme)
and the power of communication of [Talkerapp](http://talkerapp.com).

##Install

    gem install memetalk

You have to set your Talker credentials in a file named `~/.memetalkrc`:

    talker:
      token: 'MY_TOKEN' (you can get your token in Talkerapp's Settings)
      room: 1487        (your room ID)

##Usage

To list the available meme generators, just type `memetalk --help`. The syntax
goes like this:

    memetalk GENERATOR "LINE1" "OPTIONAL LINE 2"

When you have chosen a proper generator for the message you want to communicate
to your fellow colleagues, do the following:

    memetalk Y_U_NO "TESTS" "WHY U NO GREEN"

And look at your Talker room! 

##Contribute!

* Fork the project.
* Make your feature addition or bug fix.
* Add specs for it. This is important so I don't break it in a future
  version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  If you want to have your own version, that is fine but bump version
  in a commit by itself I can ignore when I pull.
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2011 Josep M. Bach. See LICENSE for details.
