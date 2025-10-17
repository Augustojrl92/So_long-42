# 🕹️ So_long-42

A small 2D adventure game made in C using **MiniLibX**.  
Collect items, avoid walls, and reach the exit through a custom `.ber` map parser.

---

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
```

Esto genera el ejecutable:

```bash
./so_long
```

Versión bonus (contadores y animaciones):

```bash
make bonus
```

### 🧹 Limpieza

```bash
make clean   # elimina objetos
make fclean  # elimina todo
make re      # recompila desde cero
```

---

## 🗺️ Formato del mapa

El mapa debe estar guardado en un archivo con extensión `.ber`  
y cumplir las siguientes reglas:

- Cerrado por muros (`1`).
- Debe contener al menos:
  - 1 salida (`E`)
  - 1 jugador (`P`)
  - 1 coleccionable (`C`)
- Compuesto solo por los caracteres válidos:  
  `0` (suelo), `1` (muro), `C` (coleccionable), `E` (salida), `P` (jugador).

### 🧩 Ejemplo de mapa

```
1111111
1P0C0E1
1000001
1111111
```

---

## 🎮 Controles del juego

| Tecla | Acción |
|:------|:--------|
| `W`   | Mover hacia arriba |
| `A`   | Mover hacia la izquierda |
| `S`   | Mover hacia abajo |
| `D`   | Mover hacia la derecha |
| `ESC` | Salir del juego |

---

## 🧩 Estructura del proyecto

```
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
```

---

## 🧾 Recursos usados

- [MiniLibX](https://harm-smits.github.io/42docs/libs/minilibx)
- [X11 / mlx.h documentación no oficial](https://qst0.github.io/ft_libgfx/man_mlx/)
- Funciones propias de **Libft** y **GNL** integradas.

---

## 🧱 Normas 42

- Sin **leaks** de memoria (`valgrind` recomendado).
- Cumple la **Norminette**.
- Solo funciones autorizadas.
- Mapa y errores validados correctamente.
- Uso correcto de `make` y de la estructura del bonus.

---


