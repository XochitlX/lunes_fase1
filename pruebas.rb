#7690939204

module Calculo
  def calculando(number)
    @number = number
    self
  end
  def output
    p Math.sqrt(@number)
  end
end

class Raiz
  extend Calculo
end


Raiz.calculando(7690939204).output