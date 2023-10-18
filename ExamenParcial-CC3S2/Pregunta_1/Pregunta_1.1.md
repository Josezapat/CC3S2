Implementación de un programa grep simplificado en Ruby.

```ruby
if ARGV.length < 2
    puts "Uso: ruby grep.rb [opciones] cadena_de_busqueda archivo1 archivo2 ..."
    exit
  end
```
Definimos las Variables para los indicadores iniciandolos con = "false"

```ruby
  show_numero_linea = false
  show_archivo_nombre = false
  case_insensitive = false
  invertir_coincidencia = false
  exacta_coincidencia = false
```
  

Aqui procesamos los indicadores 

```ruby
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
```
  

Obtenemos la cadena de búsqueda 

```ruby
 search_string = ARGV.shift
```
  

Hacemos una iteración sobre los archivos especificados

```ruby

  ARGV.each do |archivo_nombre|
    begin
      File.open(archivo_nombre, 'r') do |file|
        linea_numero = 0
        while (line = file.gets)
          linea_numero += 1
          line.chomp! 
```
  

Finalmente realizamos la búsqueda 
```ruby
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
```

Un mensaje de error si un archivo no fue encontrado

```ruby

    rescue Errno::ENOENT
      puts "Archivo no encontrado: #{archivo_nombre}" if show_archivo_nombre
    end
  end
```

Finalmente al compilar el codigo obtenemos este resultado:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/96d9b1a1-696c-4971-a447-32d92b963365)

ya que la longitud de ARGV es menor que 2
