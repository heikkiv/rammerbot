require "test/unit"
require_relative '../yammer_message'

class YammerMessageTest < Test::Unit::TestCase

  def test_creation
    msg = YammerMessage.new('heikki', 'How U doin?')
    assert_equal 'heikki', msg.sender
    assert_equal 'How U doin?', msg.text
  end
  
end