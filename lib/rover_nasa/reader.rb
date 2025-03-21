# lib/rover_nasa/reader.rb
module RoverNasa
  class Reader
    def self.read(file_path)
      # Leo el archivo
      archivo = File.readlines(file_path).map(&:strip)

      # Reviso si hay info
      if archivo.size > 2
        # Saco el tamaño del terreno
        tamano_terreno = archivo[0].split(" ").map(&:to_i)

        # Preparo la data
        data_rovers = []

        # Proceso las líneas
        i = 1
        while i < archivo.size
          posicion_rover = archivo[i]
          comandos_rover = archivo[i + 1]

          # Si hay info
          if posicion_rover && comandos_rover
            posicion_array = posicion_rover.split(" ")
            if posicion_array.size == 3
              x = posicion_array[0].to_i
              y = posicion_array[1].to_i
              direccion = posicion_array[2].upcase

              # Valido la dirección
              if %w[N E S W].include?(direccion)
                # Valido los comandos
                comandos_validos = true
                comandos_rover.each_char do |c|
                  if !['L', 'R', 'M'].include?(c)
                    comandos_validos = false
                    break
                  end
                end
                if comandos_validos
                  # Guardo todo
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
        # Devuelvo
        { grid_size: tamano_terreno, rovers_data: data_rovers }
      else
        # Devuelvo por defecto
        { grid_size: [0,0], rovers_data: [] }
      end
    end
  end
end
