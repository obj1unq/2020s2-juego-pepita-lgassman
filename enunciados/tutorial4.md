# Tutorial 4

> Objetivo del nivel: Usar Clases y analizar el momento de la instanciación.
> Objetivos secundatios:  Generación de números aleatorios. Se usan colecciones. Se puede usar un abstract factory.


### Contexto

Pepita va a poder alimentarse en el camino para poder llegar al nido.
Los alimentos aparecen de manera aleatoria en el juego. 


### Requerimientos

#### Colisión con comidas preestablecidas
1. Hacer que pepita coma una comida cuando colisiona contra ella. Una vez comida la comida, debe desaparecer del juego. 
2. Hacer que pueda comer diferentes manzanas. Cada manzana tiene su propia posición. 
3. Pepita puede comer diferentes montoncitos de alpiste. Cada montoncito podrá tener peso diferente. 
La energia que aporta es de una caloría por cada gramo de peso.
   
### Aparición aleatoria de comidas
 
1. Al inicio del juego no hay comidas. Cada 3 segundos aparece en una posición vacía al azar una manzana. 
2. Sólo puede haber 3 alimentos a la vez en el tablero. Por lo tanto al pasar los 3 segundos, si ya hay 3 alimentos no aparece nada.
3. Incorporar la posibilidad de que aparezca un montoncito de alpiste en lugar de una manzana. Hay un 50% de probabilidad para cada uno.
   El montoncito de alpiste tiene un peso al azar de entre 40 y 100 gramos.
