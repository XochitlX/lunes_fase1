class Controller 
  def initialize(args)
    @view = View.new
    welcome
  end

  #Primera vista para Reservar o entrar como Admin
  def welcome
    option = @view.welcome
    if option == "1"
      reservation
    elsif option == "2"
      administrator
    elsif option == "3"
      #
    end        
  end

  #Met para Reservar o salir
  def reservation
    opt = @view.reservations
    if opt == "1"
      tickets
    elsif opt == "2"
      #
    else
      error
    end  
  end

  #Para reservar.., el usuario verá los vuelos disponibles
  #según sus necesidades
  def tickets
    #[from, to, date, passengers] 
    data_reservation = @view.selec_flight
    flight_available = []

    fligths = Flight.all
    fligths.each do |flight|
      if flight.from == data_reservation[0] && flight.to == data_reservation[1] && 
        flight.date == Date.parse(data_reservation[2]) && data_reservation[3].to_i <= flight.passenger 
        flight_available << flight
        #p flight.duration.strftime("%I:%M:%S")
      end
    end
    #select = 
    #p data_reservation
    #p flight_available
    pass = data_reservation[3]
    select = @view.available(data_reservation[0], data_reservation[1], flight_available)
    book(flight_available, select, pass)
    #Booking.create()
  end

  #Met. para realizar la Reservacion, creando y actualizando base
  def book(for_book, select_flight, number_pass)
    number_pass = number_pass.to_i
    booking_f = for_book[select_flight.to_i - 1]
    p t = booking_f.id
    price = number_pass * booking_f.cost
    bo = Booking.all
    bo = 1701 + bo.count
    pass = booking_f.passenger - number_pass

    book_f = Booking.create(num_booking: bo, total: price)
    fligth_f = Flight.update(t, passenger: pass)

    @answer = @view.book(booking_f, number_pass)
    if @answer[2] == "SI"
      p 
      final_print(book_f)
    elsif @answer[2] == "NO"
      b = Booking.find(book_f.id)
      Booking.destroy(book_f.find(b))
      Flight.update(id: t.id, passenger: t.passenger + number_pass)
    end    
  end

  def final_print(data_flight)
    @view.final_print(data_flight)

    for item in 0..@answer[0].length - 1
      User.create(name: @answer[0][item], email: @answer[1][item])
    end
    
  end

  def administrator
    data_admon = @view.administrator
    users = User.all 
    users.each do |item|
      p item.admin
      if item.admin == true && item.name == data_admon[0]
        options = @view.menu_administrator
        info(options)
      # else
      #   administrator
      end
    end
  end

  def info(option)
    data = []
    data_fligths = Flight.all
    data_bookings = Booking.all
    
    if option == "1" #todos los vuelos
      data_fligths.each do |flight|
        data << flight
      end
      @view.all_flights(data)
    elsif option == "2"
      data_bookings.each do |book|
      data << book
      end
      @view.booking(data)
    elsif option == "3"
      new_flight
    end
  end
  
  def new_flight
    data = @view.new_flight
    Flight.create(num_flight: data[0], date: data[1], depart: data[2], from: data[3], to: data[4], duration: data[5], cost: data[6], passenger: data[7])
  end
  
  def error
    @view.error
    welcome
  end
end
