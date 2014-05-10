require_relative 'test_parent'
require_relative 'test_a'

class TestB < TestParent
  def hello
    puts "hello B"
  end
end

