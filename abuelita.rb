
def deaf_grandma
  count = 1
  loop do
    print "Hablale a la abuelita....."
    state = gets.chomp
    if state.upcase == "BYE TQM" || state.downcase == "bye tqm"
      count += 1
      break if count == 3
    elsif state.upcase == state
      p "NO, NO DESDE 1983"
    else
      p "HUH?! NO TE ESCUCHO, HIJO!"
    end
  end
end

deaf_grandma
  

