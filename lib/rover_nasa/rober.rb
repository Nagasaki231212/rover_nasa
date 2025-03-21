class Rover
  attr_accessor :x, :y, :direccion 

  def initialize(x, y, direccion)
      @x = x 
      @y = y 
      @direccion = direccion
  end 

  def girar_a_la_izquierda
      case @direccion
      when 'N' then @direccion = 'O'
      when 'E' then @direccion = 'N'
      when 'S' then @direccion = 'E'
      when 'O' then @direccion = 'S'
      end 
  end 

  def girar_a_la_derecha
      case @direccion
      when 'N' then @direccion = 'E'
      when 'E' then @direccion = 'S'
      when 'S' then @direccion = 'O'
      when 'O' then @direccion = 'N'
      end
  end 

  def mover_rovers
      case @direccion
      when 'N' then @y += 1 
      when 'E' then @x += 1
      when 'S' then @y -= 1
      when 'O' then @x -= 1
      end 
  end 

  def to_s
    "#{x}, #{y}, #{direccion}"
  end
end 

rover = Rover.new(0, 0, 'N')
rover.mover_rovers
puts rover
rover.girar_a_la_derecha
rover.mover_rovers
puts rover