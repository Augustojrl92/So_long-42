# So_long-42
🕹️ A small 2D adventure game made in C using MiniLibX. Collect items, avoid walls, and reach the exit through a custom .ber map parser.

# 🎮 So_long

**So_long** es un proyecto del cursus 42 cuyo objetivo es desarrollar un pequeño videojuego 2D utilizando **MiniLibX**, la librería gráfica de bajo nivel de 42.  
El jugador debe moverse por un mapa, recoger todos los objetos y alcanzar la salida, evitando errores de mapa y validando la jugabilidad.

---

## 🧠 Objetivo del proyecto

- Cargar y validar un mapa desde un archivo `.ber`.
- Renderizar gráficos con MiniLibX (texturas `.xpm`).
- Permitir movimiento del jugador (W, A, S, D).
- Controlar el recuento de pasos.
- Detectar colisiones, recogidas y salida.
- Gestionar errores y liberar memoria correctamente.

---

## ⚙️ Instalación y compilación

### 🔧 Requisitos
- Sistema Linux o macOS.
- Librería **MiniLibX** (ya incluida en tu repo).
- `make`, `gcc`, y las dependencias de X11 o OpenGL (según tu sistema).

### 🏗️ Compilación

```bash
make
Esto genera el ejecutable:

bash
Copiar código
so_long
Versión bonus (contadores y animaciones):

bash
Copiar código
make bonus
🧹 Limpieza
bash
Copiar código
make clean   # elimina objetos
make fclean  # elimina todo
make re      # recompila desde cero
🗺️ Formato del mapa
El mapa debe estar guardado en un archivo con extensión .ber
y cumplir las siguientes reglas:

Cerrado por muros (1).

Debe contener al menos:

1 salida (E)

1 jugador (P)

1 coleccionable (C)

Compuesto solo por los caracteres válidos:
0 (suelo), 1 (muro), C (coleccionable), E (salida), P (jugador).

Ejemplo de mapa
Copiar código
1111111
1P0C0E1
1000001
1111111
🎮 Controles del juego
Tecla	Acción
W	Mover hacia arriba
A	Mover hacia la izquierda
S	Mover hacia abajo
D	Mover hacia la derecha
ESC	Salir del juego

🧩 Estructura del proyecto
css
Copiar código
so_long/
├── Makefile
├── so_long.c              → función main, inicialización del juego
├── inc/
│   └── so_long.h          → cabecera principal, structs y prototipos
├── parsing/
│   ├── parsing.c          → lectura y validación del mapa
│   ├── checkmap.c         → comprobación de muros y caracteres
│   └── stockmap.c         → almacenamiento del mapa en memoria
├── display/
│   ├── display.c          → renderizado del mapa y sprites
│   ├── draw.c             → dibuja cada textura con MiniLibX
│   ├── printtexture.c     → carga y pinta imágenes .xpm
│   ├── moveplayer.c       → gestiona el movimiento del jugador
│   ├── keyboard.c         → control de entradas del teclado
│   └── itoa.c             → conversión para mostrar pasos
├── GNL/                   → implementación de get_next_line
└── bonus/                 → versión bonus con animaciones y contador
🧠 Flujo del programa
mermaid
Copiar código
flowchart TD
    A([Inicio]) --> B[Leer archivo .ber con get_next_line]
    B --> C[Validar mapa con parsing/checkmap.c]
    C --> D{¿Mapa válido?}
    D -- No --> Z[Error: mapa inválido / salida]
    D -- Sí --> E[Cargar texturas con MiniLibX]
    E --> F[Renderizar mapa inicial]
    F --> G[Esperar entrada del jugador (WASD)]
    G --> H[Actualizar posición del jugador]
    H --> I{¿Jugador recogió C?}
    I -- Sí --> J[Decrementar contador de coleccionables]
    I -- No --> K
    J --> K[Redibujar mapa y contador de pasos]
    K --> L{¿Jugador llega a E y no quedan C?}
    L -- Sí --> M[Mostrar mensaje de victoria / salir]
    L -- No --> F
    M --> N([Fin])
