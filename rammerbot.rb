require 'cinch'
require_relative 'yammer_client'

bot = Cinch::Bot.new do
  
  client = YammerClient.new(ENV['TOKEN'])
  
  configure do |c|
    c.nick = 'YammerBot'
    c.server = "irc.freenode.org"
    c.channels = ["#rammer-bots"]
  end

  on :message, "latest id" do |m|
    #m.reply "Hello, #{m.user.nick}"
    Channel('#rammer-bots').msg(client.get_latest_message_id)
  end
  
  on :private, "latest message" do |m|
    ym = client.get_latest_message
    m.reply "#{ym['sender']['full_name']}: #{ym['body']['plain']}"
  end
  
  on :private, "help" do |m|
    m.reply "commands: 'latest message'"
  end
  
end

bot.start
