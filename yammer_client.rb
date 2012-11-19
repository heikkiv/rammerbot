require 'open-uri'
require 'json'
require_relative 'yammer_message'

class YammerClient

	attr_accessor :token
  
  def initialize(token)
    @token = token
  end

	def get_latest_message_id
    uri = URI("https://www.yammer.com/api/v1/messages.json?limit=1&access_token=#{@token}")
    response = JSON.parse(uri.read)
    if response['messages'] && response['messages'].length > 0
      return response['messages'][0]['id'].to_i
    else
      return -1
    end
  end
  
	def get_latest_message
    uri = URI("https://www.yammer.com/api/v1/messages.json?limit=1&access_token=#{@token}")
    response = JSON.parse(uri.read)
    if response['messages'] && response['messages'].length > 0
      m = response['messages'][0]
      sender = get_user(m['sender_id'])
      m['sender'] = sender
      return m
    else
      return {}
    end
  end
  
  def get_user(id)
    uri = URI("https://www.yammer.com/api/v1/users/#{id}.json?access_token=#{@token}")
    JSON.parse(uri.read)
  end
	
end