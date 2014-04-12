class Player
  def initialize(input)
    @woods = input.split(' ').sort_by {|i| i.to_f}
    @points = 0
  end

  attr_reader :points
  attr_accessor :woods

  def closest_value(target)
    ceiling_value = nil
    @woods.each do  |wood|
      if wood > target
        ceiling_value = wood
        break
      end
    end
    ceiling_value
  end

  def inc_points
    @points += 1
  end

  def burn_wood(wood)
    @woods.delete(wood)
  end
end

class War
  def war(inputs)
    outputs = []
    inputs.each do |number_of_woods, naomi_woods, ken_woods|
      naomi = Player.new(naomi_woods)
      ken = Player.new(ken_woods)
      naomi.woods.each do |naomi_wood|
        ken_wood = ken.closest_value(naomi_wood)
        if ken_wood
          ken.inc_points
        else
          naomi.inc_points
        end
        ken.burn_wood(ken_wood)
      end
      outputs.push(naomi.points)
    end
    outputs
  end
end


i_dir = '/Users/mavenhive/Public/codejam/deceitful_war/inputs'
o_dir = '/Users/mavenhive/Public/codejam/deceitful_war/outputs'
output = []
original_inputs = File.readlines(i_dir + '/A-test-practice.in').drop(1).each_slice(3).to_a
war = War.new
output = war.war(original_inputs)
puts output


#Write output to file
#File.open(o_dir + '/A-large-practice.out', 'w+') do |file|
#  output.each_slice(2).to_a.each_with_index do |element, index|
#    index += 1
#    file.puts('Case #'+ index.to_s + ':  ' + element.join(' '))
#  end
#end
