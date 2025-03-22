module RoverNasa
  class Reader
    def self.read(file_path)
      archivo = File.readlines(file_path).map(&:strip)

      if archivo.size > 2
        tamano_terreno = archivo[0].split(" ").map(&:to_i)

        data_rovers = []

        i = 1
        while i < archivo.size
          posicion_rover = archivo[i]
          comandos_rover = archivo[i + 1]

          if posicion_rover && comandos_rover
            posicion_array = posicion_rover.split(" ")
            if posicion_array.size == 3
              x = posicion_array[0].to_i
              y = posicion_array[1].to_i
              direccion = posicion_array[2].upcase

              if %w[N E S W].include?(direccion)
                comandos_validos = true
                comandos_rover.each_char do |c|
                  if !['L', 'R', 'M'].include?(c)
                    comandos_validos = false
                    break
                  end
                end
                if comandos_validos
                  data_rovers << {
                    initial_position: [x, y, direccion],
                    commands: comandos_rover.upcase.chars
                  }
                end
              end
            end
          end
          i += 2
        end
        { grid_size: tamano_terreno, rovers_data: data_rovers }
      else
        { grid_size: [0,0], rovers_data: [] }
      end
    end
  end
end
