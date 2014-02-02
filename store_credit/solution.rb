i_dir = '/Users/mavenhive/Public/codejam/store_credit/inputs'
o_dir = '/Users/mavenhive/Public/codejam/store_credit/outputs'
output = []
inputs = File.readlines(i_dir + '/A-large-practice.in').drop(1).each_slice(3).to_a
inputs.each do |credit, length, inps|
  inps_split_map = inps.split(' ').map(&:to_i)
  inps_split_map.combination(2).each do |combination|
    sum = combination.inject(0) {|sum, number| sum + number}
    if credit.to_i == sum
      combination.each_with_index do |number, i|
        output_index = inps_split_map.index(number) + 1 if i == 0  #Index should not repeat
        output_index = inps_split_map.rindex(number) + 1 if i == 1
        output.push(output_index)
      end
      break
    end
  end
end

#Write output to file
File.open(o_dir + '/A-large-practice.out', 'w+') do |file|
  output.each_slice(2).to_a.each_with_index do |element, index|
    index += 1
    file.puts('Case #'+ index.to_s + ':  ' + element.join(' '))
  end
end





