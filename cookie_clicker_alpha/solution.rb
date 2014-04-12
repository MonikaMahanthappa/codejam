class Cookie_factory
  def initialize(input)
    input_arr = input.split(' ')
    @cost =  input_arr[0].to_f
    @f = input_arr[1].to_f
    @x = input_arr[2].to_f
    @cookie_per_sec = 2
    @cookies = 0
    @previous_time_taken_by_waits = []
    @deltas = []
  end

  attr_reader :cost, :x, :f, :cookie_per_sec
  attr_accessor :cookies, :previous_time_taken_by_waits, :deltas

  def inc_cookie_per_sec
    @cookie_per_sec += @f
  end

  def reset_cookies
    @cookies = 0
  end

  def push_delta(current_wait_time)
    @deltas.push(@previous_time_taken_by_waits.last - current_wait_time)  if @previous_time_taken_by_waits.length > 0
  end
end

i_dir = '/Users/mavenhive/Public/codejam/cookie_clicker_alpha/inputs'
o_dir = '/Users/mavenhive/Public/codejam/cookie_clicker_alpha/outputs'
outputs = []
inputs = File.readlines(i_dir + '/A-small-attempt0.in').drop(1).to_a
count = 0
inputs.each do |inp|
  data = Cookie_factory.new(inp)
  sec = 0
  if data.cost > data.x
    sec = data.x / data.cookie_per_sec
    outputs.push(sec)
  else
    until 0 < 0 do
      time_to_earn_cookies_by_waiting = data.x / data.cookie_per_sec
      time_to_buy_farm = data.cost / data.cookie_per_sec
      sec_by_waiting = sec + time_to_earn_cookies_by_waiting
      sec += time_to_buy_farm
      data.inc_cookie_per_sec
      data.push_delta(sec_by_waiting)
      data.previous_time_taken_by_waits.push(sec_by_waiting)
      if data.deltas.length > 1 && (data.deltas.last > data.deltas[-2])
        break
      end
    end
    outputs.push(data.previous_time_taken_by_waits.min)
  end
end

#Write output to file
File.open(o_dir + '/A-small-attempt0.out', 'w+') do |file|
  outputs.each_with_index do |element, index|
    index += 1
    file.puts('Case #'+ index.to_s + ':  ' + element.to_s)
  end
end
