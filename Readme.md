# RammerBot - IRC bot for yammer written in ruby

RammerBot is a simple IRC bot for piping your [yammer](http://yammer.com) messages to irc. It's written in Ruby using [Cinch](https://github.com/cinchrb/cinch) and meant to run on heroku.

## Configuration

### IRC

TODO Set the `IRC_SERVER` and `IRC_CHANNEL` environment variables.

### Yammer

Create a yammer application and do the oauth dance.

Set your yammer application oauth token to the `TOKEN` environment variable.
