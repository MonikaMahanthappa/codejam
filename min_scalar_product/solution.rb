i_dir = '/Users/mavenhive/Public/codejam/min_scalar_product/inputs'
o_dir = '/Users/mavenhive/Public/codejam/min_scalar_product/outputs'
output = []
inputs = File.readlines(i_dir + '/A-large-practice.in').drop(1).each_slice(3).to_a
inputs.each do |n, x_vector, y_vector|
  x_asc =  x_vector.split(' ').sort_by {|i| i.to_i}
  y_des =  y_vector.split(' ').sort_by {|i| -i.to_i}
  sum = 0
  x_asc.zip(y_des) do |x, y|
    sum +=  x.to_i * y.to_i
  end
  output.push(sum)
end

#puts output


#Write output to file
File.open(o_dir + '/A-large-practice.out', 'w+') do |file|
  output.each_with_index do |element, index|
    index += 1
    file.puts('Case #'+ index.to_s + ':  ' + element.to_s)
  end
end
