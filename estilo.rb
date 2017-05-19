
class PERSON
  LIFE_stage = {childhood:12, teenager:19, adult:50}
  LEGAL_AGE = 18
  attr_reader :name
  attr_writer :name

  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def age
    return @age
  end

  def life_stage
    if @age < LIFE_stage[:childhood]
      return :childhood
    elsif @age < LIFE_stage[:teenager] 
      return :teenager
    elsif @age < LIFE_stage[:adult]
      return :adult
    else
      return :elder
    end
  end

  def legal
    return @age >= LEGAL_AGE
  end
end


# This part of the code are tests.
# Before and after this should print "true".
 
fernando = PERSON.new("Fernando",5)
juan = PERSON.new("Juan",45)
laura = PERSON.new("Laura",87)
andrea = PERSON.new("Andrea",13)

puts fernando.legal == false
puts juan.legal == true
puts laura.legal == true
puts andrea.legal == false

puts fernando.life_stage == :childhood
puts juan.life_stage == :adult
puts laura.life_stage == :elder
puts andrea.life_stage == :teenager

puts laura.age == 87
laura.name = "Ximena"
puts laura.name == "Ximena"
