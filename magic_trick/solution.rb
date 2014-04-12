i_dir = '/Users/mavenhive/Public/codejam/magic_trick/inputs'
o_dir = '/Users/mavenhive/Public/codejam/magic_trick/outputs'
output = []
inputs = File.readlines(i_dir + '/A-small-practice.in').drop(1).each_slice(10).to_a
inputs.each do |first_choice, row_1, row_2, row_3, row_4, sec_choice, sec_row_1, sec_row_2, sec_row_3, sec_row_4|
  first_arrangement = [row_1, row_2, row_3, row_4]
  second_arrangement = [sec_row_1, sec_row_2, sec_row_3, sec_row_4]
  first_selected_row = first_arrangement[first_choice.to_i - 1]
  sec_selected_row = second_arrangement[sec_choice.to_i - 1]
  selcted_number = first_selected_row.split(' ') & sec_selected_row.split(' ')
  if selcted_number.empty?
    voila = 'Volunteer cheated!'
  elsif selcted_number.length > 1
    voila = 'Bad magician!'
  else
    voila = selcted_number[0]
  end
  output.push(voila)
end

puts output

#Write output to file
File.open(o_dir + '/A-small-practice.out', 'w+') do |file|
  output.each_with_index do |element, index|
    index += 1
    file.puts('Case #'+ index.to_s + ':  ' + element)
  end
end
