=begin
def shipping(address)
  address = address.split(" ") #separo en array en cada espacio

  for i in 1..address.length
    if address[i] == "Mexico"
      ok = 1
    end
  end
  if ok == 1
    msn = "Order received"
  else
    msn = "We only ship orders to Mexico"
  end
end
# Pruebas
p shipping('Insurgentes Sur 8932, Alvaro Obregon, Mexico') == "Order received"
p shipping('Geary Blvd 3320, San Francisco, Estados Unidos') == "We only ship orders to Mexico"


def say_hi(name)
  if name =="Juan"
    puts "Welcome back"
  else
    puts "Hi"
  end
end

# Pruebas
p say_hi('Daniel') == "Welcome back"
p say_hi('Juan') == "Hi, Juan"


def error_message(name, credit_card_type, credit_card_number)
  num = "xxx-" + credit_card_number[credit_card_number.length-3, 3]
  credit_card_type = credit_card_type.upcase
  msn = "#{name}, The #{credit_card_type} Credit Card Number '#{num}' You Provided is Invalid."
end

#Pruebas
p error_message('Rodrigo', 'American Express', '205782460166975') == "Rodrigo, The AMERICAN EXPRESS Credit Card Number 'xxx-975' You Provided is Invalid."
p error_message('Carla', 'Visa', '3912888888881881') == "Carla, The VISA Credit Card Number 'xxx-881' You Provided is Invalid."



payment = "Welcome, your Visa Credit Card has been processed"
payment = payment.split(" ")
for i in 1..payment.length
  if payment[i] == "Visa"
    ok = 1
  end
end
if ok == 1
  puts "Credit Card has been Charged"
else
  puts "We only accept visa credit card"
end


name = "xochit1"
age = 20

if name == "xochitl"
  if age >= 18
    puts "Welcome"
  else
    puts "No eres Mayor de Edad"
  end
else
  puts "No eres Mayor de Edad"
end


p first_name = "Carlos"
p first_name.upcase
p first_name
#=>"Carlos"

p last_name = "Rangel"
p last_name.upcase!
p last_name
#=>"RANGEL"



first_name = "Rogelio"
first_name.upcase!
last_name = "manzano"
last_name.capitalize!
mensaje = "Nombre Correcto"
mensaje.downcase!

puts mensaje if first_name == "ROGELIO" && last_name == "Manzano"

=end


def large (msn)
  if (msn.length) > 20
    msn = msn.upcase
  end
  return msn
end

p large("Hola vamos a la comida") == "HOLA VAMOS A LA COMIDA"
p large("Es hora de dormir") == "Es hora de dormir"
