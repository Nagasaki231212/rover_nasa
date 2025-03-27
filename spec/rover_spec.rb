require_relative "../lib/rover_nasa/rover"

RSpec.describe Rover do
  it "Mover el rover con indicaciones 🚀" do
    rover = Rover.new(1, 2, 'N') 
    indicaciones = "LMLMLMLMM".chars

    indicaciones.each do |indicacione|
      if indicacione == 'L'
        rover.girar_a_la_izquierda
      elsif indicacione == 'R'
        rover.girar_a_la_derecha
      elsif indicacione == 'M'
        rover.mover_rovers
      end
    end

    expect(rover.to_s).to eq("1, 3, N") 
  end
end
