File.readlines('/Users/mavenhive/Downloads/B-small-practice.in').drop(1).each_with_index do |line|
  line = line.split(' ').reverse.join(' ')
  puts "#{line}"
end





