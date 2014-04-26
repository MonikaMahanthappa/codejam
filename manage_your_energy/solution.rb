i_dir = '/Users/mavenhive/Public/codejam/manage_your_energy/inputs'
o_dir = '/Users/mavenhive/Public/codejam/manage_your_energy/outputs'
output = []
inputs = File.readlines(i_dir + '/B-small-practice.in').drop(1).each_slice(2).to_a
inputs.each do |energy, value|
  #puts value
  value = value.split(' ').map { |x| x.to_i}
  max_energy = energy.split(' ')[0].to_i
  gain = energy.split(' ')[1].to_i
  max_gain = 0
  length = value.length
  length.times do
    max_value = value.max
    #puts "me: #{max_energy}"
    #puts "mv: #{max_value}"
    max_gain += max_energy * max_value
    max_energy = max_energy - max_energy + gain
    index = value.find_index(max_value)
    value.delete_at(index)
  end
  puts max_gain
  output.push(max_gain)
end

#Write output to file
File.open(o_dir + '/B-small-practice.out', 'w+') do |file|
  output.each_with_index do |element, index|
    index += 1
    file.puts('Case #'+ index.to_s + ':  ' + element.to_s)
  end
end





