require_relative  'test_parent'

class TestA  < TestParent
  def hello
    puts "hello A"
  end

end