Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  game = Codebreaker::Game.new(output)
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  expect(terminal_output.messages).to include(message)
  # RSpec now has a built in matcher
  # give it a try when the first one passes
  # expect(game.start).to output(message).to_stdout
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
