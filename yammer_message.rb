class YammerMessage

  attr_accessor :text, :sender

  def initialize(sender, text)
    @sender = sender
    @text = text
  end

end
