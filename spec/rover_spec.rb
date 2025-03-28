require_relative "../lib/rover_nasa/rover"

RSpec.describe Rover do
  it "Mover el rover con pura fuerza de voluntad 🇻🇪" do
    rover = Rover.new(1, 2, 'N') 

    rover.ejecutar_comandos("LMLMLMLMM") 
    expect(rover.to_s).to eq("1, 3, N") 
  end

  it "Comprobando que el Rover inicia bien 🛰️" do
    rover = Rover.new(3, 3, 'E')  

    expect(rover.x).to eq(3)
    expect(rover.y).to eq(3)
    expect(rover.direccion).to eq('E')
  end
end

