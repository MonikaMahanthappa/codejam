i_dir = '/Users/mavenhive/Public/codejam/min_scalar_product/inputs'
o_dir = '/Users/mavenhive/Public/codejam/min_scalar_product/outputs'
output = []
inputs = File.readlines(i_dir + '/A-small-practice.in').drop(1).each_slice(3).to_a
inputs.each do |n, x_vector, y_vector|


end

#Write output to file
#File.open(o_dir + '/A-large-practice.out', 'w+') do |file|
#  output.each_slice(2).to_a.each_with_index do |element, index|
#    index += 1
#    file.puts('Case #'+ index.to_s + ':  ' + element.join(' '))
#  end
#end
