class View
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  # Los siguientes métodos son sólo un ejemplo:
  
  def welcome
    puts
    puts
    puts "--------------------------------------------------"
    puts "Bienvenido a Vuelos Codea"
    puts "--------------------------------------------------"
    puts "1) Reservaciones"
    puts "2) Administrador"
    puts "3) Salir"
    puts
    puts "Selecciona opción: "
    gets.chomp
  end

  def administrator  #Opcion2
    puts
    puts
    puts "--------------------------------------------------"
    puts "Bienvenido Administrador"
    puts "--------------------------------------------------"
    puts "Ingrese usuario:"
    user = gets.chomp
    puts "Ingrese contraseña:"
    password = gets.chomp
    [user, password]      
  end

  def menu_administrator
    puts
    puts
    puts "--------------------------------------------------"
    puts "Bienvenido Administrador"
    puts "--------------------------------------------------"
    puts "1) Muestra todos los vuelos"
    puts "2) Muestra todas las reservaciones"
    puts "3) Crea un nuevo vuelo"
    puts "4) Salir"
    puts
    puts "Selecciona opción: "
    gets.chomp
  end

  def reservations  #Opcion1
    puts "--------------------------------------------------"
    puts "            ¡¡¡Bienvenido!!!                      "
    puts "--------------------------------------------------"
    puts
    puts "1) Encuentra tu boleto de avión"
    puts "2) Salir"
    puts
    puts "Selecciona una opción:"
    gets.chomp
  end

  def selec_flight
    puts
    puts
    puts "--------------------------------------------------"
    puts "          ¡¡¡Encuentra tu vuelo!!!                "
    puts "--------------------------------------------------"
    puts "From: "
    from = gets.chomp
    puts "To: "
    to = gets.chomp
    puts "Date: "
    date = gets.chomp
    puts "Passengers (1, 2, 3, 4...): "
    passengers = gets.chomp
    [from, to, date, passengers]    
  end

  def available(from, to, availables)
    puts
    puts "Vuelos Disponibles de '#{from}' a '#{to}' "
    puts "---------------------------------------------------------------------"
    availables.each_with_index do |flight, index|
      puts "---------------------------------------------------------------------"
      puts "#{index + 1}) No Vuelo: #{flight.num_flight}"
      puts "From: #{flight.from} To: #{flight.to}, Date: #{flight.date}" 
      puts "Depart: #{flight.depart}, Duration: #{flight.duration.strftime("%I:%M:%S")}"
      puts "Precio: #{flight.cost}, Lugares disponibles: #{flight.passenger}"
      puts 
    end
    puts "Selecciona tu vuelo: "
    gets.chomp
  end

  def book(booking, passengers)
    puts
    puts "-------------------------------------------------------------------------"
    puts "Número de Vuelo Seleccionado: #{booking.num_flight}"
    puts "-------------------------------------------------------------------------"
    puts "Date: #{booking.date}, Depart: #{booking.depart}"
    puts "From: #{booking.from}, To: #{booking.to}, Duration: #{booking.duration.strftime("%I:%M:%S")}, Precio: #{booking.cost}"
    puts "-------------------------------------------------------------------------"
    puts
    name = []
    email = []
    for item in 1..passengers
      puts
      puts "Ingresa Datos de Persona #{item}: "
      puts "Nombre:"
      name << gets.chomp
      puts "email:"
      email << gets.chomp
    end
    puts
    puts "Realizar Reservación: SI / NO"
    y_n = gets.chomp 
    [name, email, y_n]
  end

  def final_print(ticket)
    #<Booking id: 8, flight_id: nil, num_booking: 1708, total: 7000>
    puts
    puts
    puts "******************************"
    puts "Reservación correcta"
    puts "******************************"
    puts
    puts "El costo total es de $#{ticket.total}"
    puts "Y tu ID de reservación es la siguiente #{ticket.num_booking}"
    puts
  end

  def all_flights(fligths)
    puts
    puts "---------------------------------------------------------------------"
    puts "VUELOS"
    puts "---------------------------------------------------------------------"
    fligths.each_with_index do |flight, index|
      puts "---------------------------------------------------------------------"
      puts "#{index + 1}) No Vuelo: #{flight.num_flight}"
      puts "From: #{flight.from} To: #{flight.to}, Date: #{flight.date}" 
      puts "Depart: #{flight.depart}, Duration: #{flight.duration.strftime("%I:%M:%S")}"
      puts "Precio: #{flight.cost}, Lugares disponibles: #{flight.passenger}"
      puts "---------------------------------------------------------------------"
    end
  end

  def booking(bookings)
    puts
    puts "---------------------------------------------------------------------"
    puts "RESERVACIONES"
    puts "---------------------------------------------------------------------"
    bookings.each_with_index do |bookingss, index|
      puts "---------------------------------------------------------------------"
      puts "#{index + 1}) No Vuelo: #{bookingss.flight_id}"
      puts "No. Reservación: #{bookingss.num_booking}" 
      puts "Precio Total: #{bookingss.total}"
      puts "---------------------------------------------------------------------"
    end
  end
	
  def new_flight
    #, duration: "1:10:00", cost: 3500, passenger: 6
    puts
    puts "---------------------------------------------------------------------"
    puts "CREANDO VUELO NUEVO"
    puts "---------------------------------------------------------------------"
    puts "Ingrese el num. de vuelo"
    num_flight = gets.chomp
    puts "Ingrese la fecha del vuelo:"
    date = gets.chomp
    puts "Ingrese la hora de salida:"
    depart = gets.chomp
    puts "Ingrese de donde es proveniente el vuelo:"
    from = gets.chomp
    puts "Ingrese hacia donde va"
    to = gets.chomp
    puts "Ingrese la duración del vuelo: "
    duration = gets.chomp
    puts "Ingrese el costo"
    cost = gets.chomp
    puts "Ingrese los asientos disponibles"
    passenger = gets.chomp
    [num_flight, date, depart, from, to, duration, cost, passenger]
  end
  
	def error
    puts "¡¡Opción inválida!!!"
	end
end
