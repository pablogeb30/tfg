---
date: 10-10-2024
tags:
  - tfg
  - godot
  - uni
  - videojuegos
state: true
---
# Preliminares

### Entorno
- Dividido en niveles o salas
- Cada sala se genera proceduralmente (algoritmo de deep learning)
- Generación se realiza:
	- Parcialmente en función de los objetos del jugador
	- Por otra parte hay un pequeño componente aleatorio
	- El resto los parámetros establecidos en el algoritmo
- Qué se genera:
	- Biomas (proceduralmente)
	- Enemigos (simples o jefes)
	- **Posible ampliación: estructuras (casas, tiendas, ruinas, etc.)**

### Plataforma de desarrollo y de juego
- El juego se va a desarrollar en Godot
- El juego se va a poder jugar en PC
### Camara
- Vista cenital con un poco de inclinación
- Centrada en el jugador
- Bastante distancia al jugador (visión amplia del entorno)
- Ventana del juego ocupa todo el ancho:
	- Cámara solo se mueve hacia adelante o hacia atrás con el movimiento del personaje
	- Esto limita la exploración hacia los laterales del nivel. Soluciones para esto:
		- Limitar la visión del personaje oscureciendo las zonas más alejadas
		- Hacer los niveles más largos que anchos
- Un ejemplo similar de perspectiva: [Archero](https://www.youtube.com/watch?v=4LRdw8LCCkU)

### Dimensiones y estilo
- 2D
- PixelArt
- Iluminación sencilla (día soleado)
- **Posible ampliación: meteorología cambiante**

### Dinámica de juego
- Partida infinita hasta la muerte del personaje
- Matando enemigos ganas experiencia
- Al ganar experiencia subes de nivel y mejoras tus habilidades
- Con mejores armas tienes más capacidad de matar enemigos
- En cada partida puedes hacer un conjunto diferente

### Estadísticas del jugador
- Vida
- Magia
- Fuerza
- Experiencia dividida en niveles

### Combate
- Sistema de combate con IA adaptativa
- No existen los turnos
- Combate a melé o a distancia
- En cada nivel puede haber: no enemigos, varios enemigos o un jefe

### Objetivos
- Aguantar lo máximo posible en la partida
- Hacer diferentes misiones (exploración, combate, recursos)

## Armas
- Diferentes calidades de armas
- Los materiales se pueden combinar para crear armas
- También se pueden combinar armas para crear mejores armas

### Posible inicio del juego
- Primer personaje empieza con: un arma aleatoria, una magia aleatoria y una habilidad pasiva aleatoria.
- Una vez se muere, el próximo personaje hereda un arma, una magia y una habilidad pasiva del personaje anterior y así sucesivamente.
- El jugador selecciona una entre tres aleatorias de cada categoría si las hay. Si el jugador no desbloquea tres de cada se elige aleatoriamente entre las desbloqueadas en cada categoría.
- Si el jugador no consigue ninguna arma, habilidad o magia nueva antes de morir, el siguiente personaje tendrá un conjunto completamente nuevo como si fuera el primer personaje del juego.

### Dudas
- ¿Perspectiva de la cámara correcta?
- ¿Tiene sentido la generación procedural en un juego por niveles?
- ¿Resulta complicado implementar un sistema de combate adaptativo?
- ¿Resulta muy complicado técnicamente guardar cierta información de partidas previas?
- ¿Alcance para el TFG correcto o es demasiado?

### Posibles nombres del juego
- Nost: a procedural journey/adventure
- Aelin: a procedural journey/adventure
- Ered: a procedural journey/adventure
