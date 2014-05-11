i_dir = '/Users/mavenhive/Public/codejam/p2/inputs'
o_dir = '/Users/mavenhive/Public/codejam/p2/outputs'
outputs = []
inputs = File.readlines(i_dir + '/B-small-attempt0.in').drop(1).each_slice(2).to_a

inputs.each do |n, letters|
  letters_ary = letters.split(' ').sort
  puts "#{letters_ary}"
  combos = letters_ary.combination(2).to_a
  has_duplicates = false
  if letters_ary.uniq.length != letters_ary.length
    has_duplicates = true
  end
  letters_ary.each_with_index do |node, i|
    n_element = letters_ary[i+1]
    if !n_element.nil?
      if node.split('').last ==  n_element.split('').first && node.split('').first == n_element.split('').last
        has_duplicates = true
        break
      end
    end
  end
  output = []
  if has_duplicates
    combos.each do |combo|
      node_1 = combo[0]
      node_2 = combo[1]
      if node_1.split('').last == node_2.split('').first || node_1.split('').last.next == node_2.split('').first
        output.push(combo)
      end
    end
  else
    connected = false
    letters_ary.each_with_index do |node, i|
      n_element = letters_ary[i+1]
      if !n_element.nil?
        if node.split('').last ==  n_element.split('').first
          connected = true
        end
      end
    end
    if connected
      output.push(1)
    end
  end
  if output.length == 0
    letters_ary = letters.split(' ').sort.reverse
    #puts "#{letters_ary}"
    combos = letters_ary.combination(2).to_a
    has_duplicates = false
    if letters_ary.uniq.length != letters_ary.length
      has_duplicates = true
    end
    letters_ary.each_with_index do |node, i|
      n_element = letters_ary[i+1]
      if !n_element.nil?
        if node.split('').last ==  n_element.split('').first && node.split('').first == n_element.split('').last
          has_duplicates = true
          break
        end
      end
    end
    output = []
    if has_duplicates
      combos.each do |combo|
        node_1 = combo[0]
        node_2 = combo[1]
        if node_1.split('').last == node_2.split('').first || node_1.split('').last.next == node_2.split('').first
          output.push(combo)
        end
      end
    else
      connected = false
      letters_ary.each_with_index do |node, i|
        n_element = letters_ary[i+1]
        if !n_element.nil?
          if node.split('').last ==  n_element.split('').first
            connected = true
          end
        end
      end
      if connected
        output.push(1)
      end
    end
  end
  outputs.push(output.length)
end

puts "#{outputs}"

#Write output to file
File.open(o_dir + '/B-small-attempt0.out', 'w+') do |file|
  outputs.each_with_index do |element, index|
    index += 1
    file.puts('Case #'+ index.to_s + ':  ' + element.to_s)
  end
end





