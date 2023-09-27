Zapata Ancco José Daniel / 20202230A

**Parte 1: Arreglos, hashes y enumerables**

1. Define un método sum(array) que tome un arreglo de números enteros como argumento y devuelva la suma de sus elementos. Para una matriz vacía, debería devolver cero. Ejecuta las pruebas asociadas a través de:

$rspec -e '#sum ' spec/parte1_spec.rb`

![image](https://github.com/Josezapat/CC3S2/assets/90808325/08af9ea8-bfa2-4fd3-8bb3-5398ae176b1e)

Defino el método sum(array) para que tome números enteros como argumento y me devuelva la suma de sus elementos

![image](https://github.com/Josezapat/CC3S2/assets/90808325/1de42583-4082-47a9-941e-81b1696f2ad9)

Al escribir $rspec -e '#sum ' spec/parte1_spec.rb` en la terminal en Gitbash se ejecutó correctamente

2. Define un método max_2_sum(array) que tome un arreglo de números enteros como argumento y devuelva la suma de sus dos elementos más grandes. Para un arreglo vacío, debería devolver cero. Para un arreglo con solo un elemento, debería devolver ese elemento (considera si los dos elementos más grandes también tienen el mismo valor). Ejecuta las pruebas asociadas a través de:

$rspec -e '#max_2_sum' spec/parte1_spec.rb

![image](https://github.com/Josezapat/CC3S2/assets/90808325/92b86a48-b6cb-4307-87ae-815de14a3415)

Defino max_2_sum

![image](https://github.com/Josezapat/CC3S2/assets/90808325/122d1740-476f-4f9f-b584-667721a0862e)

Me ejecuta correctamente en el Gitbash

3. Define un método sum_to_n?(array, n) que toma un arreglo de números enteros y un número entero adicional n, como argumentos y devuelva verdadero si dos elementos cualesquiera en el arreglo de enteros suman n. sum_to_n?([], n) debería devolver false para cualquier valor de n, por definición. Ejecuta las pruebas asociadas a través de:

$ rspec -e '#sum_to_n' spec/parte1_spec.rb

![image](https://github.com/Josezapat/CC3S2/assets/90808325/506375bd-610a-4244-92ad-e16aa27081cd)

Defino sum_to_n

![image](https://github.com/Josezapat/CC3S2/assets/90808325/fcb4b972-9ddf-4414-8833-d0fef89b4294)

Me ejecuta correctamente en el Gitbash

**Parte 2: Cadenas y expresiones regulares**

1. Define un método hello(name) que tome una cadena que represente un nombre y devuelva la cadena "Hello", concatenada con el nombre. Ejecuta las pruebas asociadas a través de:

$rspec -e '#hello' spec/parte2_spec.rb 

![image](https://github.com/Josezapat/CC3S2/assets/90808325/9732a5cd-fc91-47af-94c4-4979af8eb9f0)

Defino el mensaje 'hello'

![image](https://github.com/Josezapat/CC3S2/assets/90808325/04833eb0-fca9-42ab-8e7e-cd02ca6669a4)

Me ejecuta correctamente en el Gitbash

2. Define un método start_with_consonant?(s) que tome una cadena y devuelva verdadero si comienza con una consonante y falso en caso contrario. Asegúrate de que funcione tanto para mayúsculas como para minúsculas y para otras letras. Ejecuta las pruebas asociadas a través de:

$rspec -e '#starts_with_consonant?' spec/parte2_spec.rb

![image](https://github.com/Josezapat/CC3S2/assets/90808325/77124220-cd82-4c0e-86a2-d7b6f4af3722)

Defino el método start_with_consonant?

![image](https://github.com/Josezapat/CC3S2/assets/90808325/23b57068-ad4d-468a-8c69-989e8bedf7bd)

Se ejecuta correctamente en el Gitbash

3. Define un método binary_multiple_de_4?(s) que tome una cadena y devuelva verdadero si la cadena representa un número binario que es múltiplo de 4, como '1000'. Asegúrate de que devuelva falso si la cadena no es un número binario válido. Ejecuta las pruebas asociadas a través de:

 $rspec -e '#binary_multiple_of_4?' spec/parte2_spec.rb

![image](https://github.com/Josezapat/CC3S2/assets/90808325/c2bddf75-bfe3-4fcf-9842-9567cd699131)
 
Defino un método binary_multiple_de_4?

![image](https://github.com/Josezapat/CC3S2/assets/90808325/8bcf3af8-bc0d-4105-be7f-622aa71575b6)

Se ejecuta correctamente en el Gitbash

![image](https://github.com/Josezapat/CC3S2/assets/90808325/cd89d844-2df9-45c3-ab39-25c2e50644be)

Al Ejectuar $rspec spec/parte2_spec.rb

**Parte 3: Conceptos básicos de orientación a objetos**
Define una clase BookInStock que representa un libro con un número ISBN, isbn y el precio del libro como número de punto flotante, precio, como atributos.

Ejecuta las pruebas asociadas a través de:


$rspec -e 'getters and setters' spec/parte3_spec.rb 
     
El constructor debe aceptar el número ISBN (una cadena, ya que en la vida real los números ISBN pueden comenzar con cero e incluir guiones) como primer argumento y el precio como segundo argumento y debe generar ArgumentError (una de los tipos de excepciones integradas de Ruby) si el número ISBN es la cadena vacía o si el precio es menor o igual a cero. Incluye los getters y setters adecuados para estos atributos. Ejecuta las pruebas asociadas a través de:


$rspec -e 'constructor' spec/part3_spec.rb
     
Incluye un método price_as_string que devuelva el precio del libro formateado con un signo de dólar inicial y dos decimales, es decir, un precio de 20 debe tener el formato $20.00 y un precio de 33.8 debe tener el formato $33.80. Consulta los métodos de cadenas formateadas en Ruby.

Ejecuta las pruebas asociadas a través de:


$rspec -e '#price_as_string' spec/parte3_spec.rb
![image](https://github.com/Josezapat/CC3S2/assets/90808325/4a9a7855-c0c1-41df-bf47-3b096a16c09f)

![image](https://github.com/Josezapat/CC3S2/assets/90808325/9cd5a560-18e8-4bf7-a300-9c6b6314380e)

Se ejecuta correctamente en el Gitbash


**Algo de TDD**
Lo intenté con autotest:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/51077fef-d7c0-4fee-a4cb-2c5240f93bc5)

Pero no conseguí resultados.
