i_dir = '/Users/mavenhive/Public/codejam/problem2/inputs'
o_dir = '/Users/mavenhive/Public/codejam/problem2/outputs'
output = []
inputs = File.readlines(i_dir + '/A-large-attempt0.in').drop(1).each_slice(3).to_a
inputs.each do |credit, length, inps|

end

#Write output to file
#File.open(o_dir + '/A-large-attempt0.out', 'w+') do |file|
#  output.each_slice(2).to_a.each_with_index do |element, index|
#    index += 1
#    file.puts('Case #'+ index.to_s + ':  ' + element.join(' '))
#  end
#end
