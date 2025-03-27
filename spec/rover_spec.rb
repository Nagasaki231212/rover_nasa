require_relative "../lib/rover_nasa/rover"

RSpec.describe Rover do
  it "Mover el rover con pura fuerza de voluntad 🇻🇪" do
    rover = Rover.new(1, 2, 'N') 

    rover.ejecutar_comandos("LMLMLMLMM") 
    expect(rover.to_s).to eq("1, 3, N") 
  end
end
