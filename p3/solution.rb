#def good(num)
#  a = []
#  (0 .. num-1).to_a.each do |k|
#    a[k] = k
#  end
#  (0 .. num-1).to_a.each do |k|
#    p = (k..num-1).to_a.sample
#    a[k], a[p] =  a[p], a[k]
#  end
#  a
#end
#
#def bad(num)
#  a = []
#  (0 .. num-1).to_a.each do |k|
#    a[k] = k
#  end
#  (0 .. num-1).to_a.each do |k|
#    p = (0..num-1).to_a.sample
#    a[k], a[p] =  a[p], a[k]
#  end
#  a
#end
#
#i_dir = '/Users/mavenhive/Public/codejam/p3/inputs'
#o_dir = '/Users/mavenhive/Public/codejam/p3/outputs'
#output = []
#inputs = File.readlines(i_dir + '/C-small-practice.in').drop(1).each_slice(2).to_a
#inputs.each do |number, inps|
#  number = number.to_i
#  #puts number
#  #puts inps
#  #bad_op =  bad(number)
#  good_op =  good(number)
#  #puts "b: #{bad_op.join(' ')}"
#  #puts "g: #{good_op.join(' ')}"
#  if inps.eql?(good_op.join(' '))
#    output.push('GOOD')
#    #puts "GOOD"
#  else
#    output.push('BAD')
#    #puts "BAD"
#  end
#
#end
##puts output
#
##Write output to file
#File.open(o_dir + '/C-small-practice.out', 'w+') do |file|
#  output.each_with_index do |element, index|
#    index += 1
#    file.puts('Case #'+ index.to_s + ':  ' + element)
#  end
#end
#
#
#
def notification_msg(msg, count=1)
  msg = 'monika'
end

class Hello
  def initialize
    @msg = 'hello'
  end

  attr_accessor :msg
end

obj = Hello.new
puts obj.msg
obj.msg = 'fsf'
puts obj.msg

