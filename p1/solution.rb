def flip(input_array, index)
  input_array.each_with_index do |inp, ar_index|
    inp = inp.split('')
    if inp[index] == '1'
      inp[index] = 0
    else
      inp[index] = 1
    end
    input_array[ar_index] = inp.join('')
  end
  input_array
end

i_dir = '/Users/mavenhive/Public/codejam/p1/inputs'
o_dir = '/Users/mavenhive/Public/codejam/p1/outputs'
output = []
inputs = File.readlines(i_dir + '/A-large-practice.in').drop(1).each_slice(3).to_a
inputs.each do |n_l, outlet_inp, device|
  num_devices = n_l.split(' ')[0].to_i
  length = n_l.split(' ')[1].to_i
  original_outlet = outlet_inp.split(' ')
  device = device.split(' ')
  if ((original_outlet-device) + (device-original_outlet)).empty?
    #puts '0'
    output.push(0)
  else
    count = 0
    loop_count = 0
    #puts "orb: #{original_outlet}"
    length.times do
      length.times do
        outlet = flip(outlet_inp.split(' '), loop_count)
        if ((outlet-device) + (device-outlet)).empty?
          count += 1
          break
        end
      end
      #puts "or: #{original_outlet}"
      #puts "o: #{outlet} , i: #{loop_count}"
      #puts "d: #{device}"
      loop_count += 1
    end
    if count != 0
      #puts count
      output.push(count)
    else
      #puts 'NOT POSSIBLE'
      output.push('NOT POSSIBLE')
    end
  end
end

puts output

#inp = ['11', '00', '10']
#flip(inp, 1)



#Write output to file
#File.open(o_dir + '/A-small-attempt0.out', 'w+') do |file|
#  output.each_with_index do |element, index|
#    index += 1
#    file.puts('Case #'+ index.to_s + ':  ' + element.to_s)
#  end
#end




