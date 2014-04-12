class Player
  def initialize(input)
    @woods = input.split(' ').sort_by {|i| i.to_f}.map { |x| x.to_f }
    @deciteful_woods = []
    @points = 0
  end

  attr_reader :points, :deciteful_woods
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

  def populate_cheated_values
    first_element = @woods.first
    @deciteful_woods = @woods.drop(1)
    @deciteful_woods.push(first_element)
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

  def deceitful_war(inputs)
    outputs = []
    inputs.each do |number_of_woods, naomi_woods, ken_woods|
      naomi = Player.new(naomi_woods)
      ken = Player.new(ken_woods)
      naomi.populate_cheated_values
      naomi.deciteful_woods.each_with_index do |naomi_wood, index|
        ken_wood = ken.woods[index]
        if ken_wood > naomi_wood
          ken.inc_points
        else
          naomi.inc_points
        end
      end
      outputs.push(naomi.points)
    end
    outputs
  end
end


i_dir = '/Users/mavenhive/Public/codejam/deceitful_war/inputs'
o_dir = '/Users/mavenhive/Public/codejam/deceitful_war/outputs'
original_inputs = File.readlines(i_dir + '/A-test-practice.in').drop(1).each_slice(3).to_a
war = War.new
honest_war_output = war.war(original_inputs)
deceitful_war_output = war.deceitful_war(original_inputs)


#Write output to file
File.open(o_dir + '/A-test-practice.out', 'w+') do |file|
index = 0
  deceitful_war_output.zip(honest_war_output).each do |cheated_point, honest_point|
    index += 1
    file.puts('Case #'+ index.to_s + ':  ' + cheated_point.to_s + ' ' + honest_point.to_s)
  end
end
