Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  game = Codebreaker::Game.new(output)
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  terminal_output.messages.should include(message)
end

class Output
  def messages
    @message ||= []
  end

  def puts(message)
    @messages << message
  end
end

def terminal_output
  @output ||= Output.new
end
