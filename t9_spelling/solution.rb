alphabets = ['','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
dictionary = {
  0 => ' ',
  2 => ['A','B','C'],
  3 => ['D','E','F'],
  4 => ['G','H','I'],
  5 => ['J','K','L'],
  6 => ['M','N','O'],
  7 => ['P','Q','R','S'],
  8 => ['T','U','V'],
  9 => ['W','X','Y','Z']
}

inputs = 'hi'
limit = 3
outputs = []
inputs.upcase().split('').each do |input|
  index = alphabets.index(input)
  #puts "in: #{input}, i: #{index}"
  index = index > 18 ? index - 1 : index
  index = index == 25 ? index - 2 : index
  quotient = (index % limit) == 0 ? 3 : (index % limit)
  quotient = 4 if input == 's' || input == 'z'
  quotient = 1 if input == ''
  shift = (quotient == 3)  ? 1 : 2
  shift = 0 if input == ''
  numerator = index / limit
  #puts "q: #{quotient}, n: #{numerator + shift}"
  key = numerator + shift
  outputs.push(' ') if outputs.pop() == key
  quotient.times { outputs.push(key)}
end
puts "#{outputs.join('')}"

