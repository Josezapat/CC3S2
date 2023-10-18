***
**Si los métodos de clase son métodos de instancia, ¿qué clase contiene esos métodos de instancia?**

Los métodos de clase en Ruby son, de hecho, métodos de instancia de la clase Class. Esto aveces es confuso cuando recién aprendemos Ruby, pero en Ruby, las clases son ciertamente objetos de la clase Class. Dado que las clases son objetos que pueden tener métodos de instancia, y esos métodos de instancia son los métodos de clase de esa misma clase. 
***
**¿Cuándo es una mala idea implementar una abstracción mediante metaprogramación?**

Implementar una abstracción mediante metaprogramación puede ser una mala idea en varios casos como la falta de claridad en el código, 
los errores que a veces son dificiles de depurar, la complejidad del código y la dificultad de poder trabajar con otros desarrolladores que no estén muy familiarizados con la metaprogramación
***
**¿Siempre es malo utilizar abstracciones en el código de prueba?**

No siempre es malo utilizar abstracciones en el código de prueba, ya que el uso de abstracciones en las pruebas puede tener muchos beneficios tales como la reutilización de código o tambien nos facilita la actualización de pruebas, sin embargo Las abstracciones en las pruebas deben utilizarse con moderación y ser relevantes para los casos de uso específicos. Si se usa mucha abstracción en las pruebas puede hacer que sean difíciles de entender y mantener. Por lo tanto, el equilibrio entre abstracción y simplicidad en las pruebas depende de las necesidades de cada proyecto.
***
**¿Cuál es el requisito previo más importante antes de comenzar una refactorizació?**

El requisito previo más importante es tener un conjunto sólido de pruebas unitarias y/o pruebas de integración para la funcionalidad. Estas pruebas nos deben garantizar que la funcionalidad actual del código se mantenga después de la refactorización. 
