Implementación de un programa grep simplificado en Ruby.

```ruby
if ARGV.length < 2 

  puts "Uso: ruby grep.rb [opciones] cadena_de_busqueda archivo1 archivo2 ..." 

  exit 

end 
```
Definimos las Variables para los indicadores 

```ruby
show_line_number = false 

show_file_names = false 

case_insensitive = false 

invert_match = false 

exact_match = false 
```
  

Aqui procesamos los indicadores 

```ruby
while ARGV[0].start_with?('-') 

  case ARGV.shift 

  when '-n' 

    show_linea_nombre = true 

  when '-l' 

    show_archivo_nombre = true 

  when '-i' 

    case_insensitive = true 

  when '-v' 

    invert_match = true 

  when '-x' 

    exact_match = true 

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

ARGV.each do |file_name| 

  begin 

    File.open(file_name, 'r') do |file| 

      line_number = 0 

      while (line = file.gets) 

        line_number += 1 

        line.chomp!  # Eliminamos el salto de línea 
```
  

Finalmente realizamos la búsqueda 
```ruby
        if exact_match 

          match = line == search_string 

        else 

          match = case_insensitive ? line.downcase.include?(search_string.downcase) : line.include?(search_string) 

        end 

        if (invert_match && !match) || (!invert_match && match) 

          output = show_line_number ? "#{file_name}:#{line_number}:" : "" 

          output += line 

          puts output 

        end 

      end 

    end 
```

Un mensaje de error si un archivo no fue encontrado

```ruby

  rescue Errno::ENOENT 

    puts "Archivo no encontrado: #{file_name}" if show_file_names 

  end 

end 
```
