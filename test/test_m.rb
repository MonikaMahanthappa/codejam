require_relative 'test_parent'
require_relative 'test_a'
require_relative 'test_b'


obj1 = TestA.new
obj2 = TestB.new
obj1.hello
obj2.hello