require "test/unit"
require_relative '../yammer_client'

class YammerClientTest < Test::Unit::TestCase

  def test_creation
    client = YammerClient.new('foo_token')
    assert_equal 'foo_token', client.token
  end
  
  def test_get_latest_message_id
    client = YammerClient.new(ENV['TOKEN'])
    assert_equal 235575678, client.get_latest_message_id
  end
  
  def test_get_latest_message_id_with_invalid_token
    client = YammerClient.new('foo_bar')
    assert_raise( OpenURI::HTTPError ) { client.get_latest_message_id }
  end
  
  def test_get_latest_message
    client = YammerClient.new(ENV['TOKEN'])
    m = client.get_latest_message
    assert_equal 4579792, m['sender_id']
    assert_equal 'Heikki Verta', m['sender']['full_name']
    assert_equal 'Added twitter support to #everyplay video sharing', m['body']['plain']
  end
  
  def test_get_user
    client = YammerClient.new(ENV['TOKEN'])
    assert_equal 'Heikki Verta', client.get_user(4579792)['full_name']
  end

end
