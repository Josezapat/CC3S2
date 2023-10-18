# Implementación de un programa grep simplificado en Ruby
# Verificamos si se proporciona la cadena de búsqueda y al menos un archivo

if ARGV.length < 2
    puts "Uso: ruby grep.rb [opciones] cadena_de_busqueda archivo1 archivo2 ..."
    exit
  end
  
  # Variables para los indicadores
  show_numero_linea = false
  show_archivo_nombre = false
  case_insensitive = false
  invertir_coincidencia = false
  exacta_coincidencia = false
  
  # Procesamos los indicadores
  while ARGV[0].start_with?('-')
    case ARGV.shift
    when '-n'
      show_numero_linea = true
    when '-l'
      show_archivo_nombre = true
    when '-i'
      case_insensitive = true
    when '-v'
      invertir_coincidencia = true
    when '-x'
      exacta_coincidencia = true
    else
      puts "Opción no válida: #{ARGV[0]}"
      exit
    end
  end
  
  # Obtenemos la cadena de búsqueda
  search_string = ARGV.shift
  
  # Iteramos sobre los archivos especificados
  ARGV.each do |archivo_nombre|
    begin
      File.open(archivo_nombre, 'r') do |file|
        linea_numero = 0
        while (line = file.gets)
          linea_numero += 1
          line.chomp!  # Eliminamos el salto de línea
  
          # Realizamos la búsqueda
          if exacta_coincidencia
            match = line == search_string
          else
            match = case_insensitive ? line.downcase.include?(search_string.downcase) : line.include?(search_string)
          end
  
          if (invertir_coincidencia && !match) || (!invertir_coincidencia && match)
            output = show_numero_linea ? "#{archivo_nombre}:#{linea_numero}:" : ""
            output += line
            puts output
          end
        end
      end
    rescue Errno::ENOENT
      puts "Archivo no encontrado: #{archivo_nombre}" if show_archivo_nombre
    end
  end
  
