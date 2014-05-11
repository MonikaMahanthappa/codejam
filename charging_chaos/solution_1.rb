require 'matrix'

def flip(a,b)
  xor = []
  a.split('').each_with_index do |x, i|
    xor.push(x.to_i ^ b[i].to_i)
  end
  xor
end

i_dir = '/Users/mavenhive/Public/codejam/charging_chaos/inputs'
o_dir = '/Users/mavenhive/Public/codejam/charging_chaos/outputs'
outputs = []
inputs = File.readlines(i_dir + '/A-small-practice.in').drop(1).each_slice(3).to_a
inputs.each do |n_l, outlet_inp, device_inp|
  n = n_l.split(' ')[0].to_i
  l = n_l.split(' ')[1].to_i
  outlets = outlet_inp.split(' ')
  devices = device_inp.split(' ')
  xor_rows  = []
  not_found = outlets - devices
  if not_found.empty?
    outputs.push(0)
  else
    outlets.each do |outlet|
      xor_row = []
      devices.each do |device|
        xor = flip(outlet, device).join('')
        #puts "o: #{outlet}, d: #{device}, xor: #{xor}"
        xor_row.push(xor)
      end
      xor_rows << xor_row
    end
    xor_matrix = Matrix.rows(xor_rows)
    if (xor_matrix.each.map{|x| x} & devices).length < n
      outputs.push('NOT POSSIBLE')
    else
      n.times do |i|
        puts xor_matrix.column(i)
      end
    end
  end
end
puts outputs
#puts flip('000', '010')

#Write output to file
#File.open(o_dir + '/A-small-attempt0.out', 'w+') do |file|
#  outputs.each_with_index do |element, index|
#    index += 1
#    file.puts('Case #'+ index.to_s + ':  ' + element.to_s)
#  end
#end
