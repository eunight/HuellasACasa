# Huellas a Casa 🐾

**Huellas a Casa** es un juego de plataformas y puzles asimétrico en 2D donde un perro (Sol) y una gata (Luna) deben combinar sus diferencias físicas para sobrevivir en la naturaleza y encontrar el camino de regreso a la civilización. 

Desarrollado en [LÖVE2D](https://love2d.org/), este proyecto se centra en mecánicas cooperativas de un solo jugador ("Switching") sin depender de IA, utilizando físicas personalizadas y *grayboxing* estricto para el diseño de niveles.

## 🚀 Características Principales

*   **Físicas Asimétricas:** Controla a Sol (pesado, cae rápido, salto bajo, alta velocidad horizontal) y a Luna (ligera, salto parabólico alto, menor velocidad terrestre).
*   **Mecánica de Switch:** Alterna el control entre ambos personajes instantáneamente para resolver puzles ambientales y superar obstáculos insalvables para uno solo.
*   **Arquitectura de Estados:** Sistema robusto de `StateManager` para separar menús, introducciones y niveles, evitando el código espagueti.
*   **Colisiones Precisas:** Implementación de `bump.lua` para cajas de colisión (AABB) estables, evitando el *floaty movement* y los errores de inercia comunes.

## 🛠️ Requisitos Técnicos

Para ejecutar este proyecto en tu entorno local, necesitas:
*   [LÖVE 11.4](https://love2d.org/) (o superior) instalado en tu sistema.
*   Librería `bump.lua` (incluida en el directorio `libs/`).

## 🎮 Controles Básicos (Graybox)

*   **Flechas / A-D:** Movimiento horizontal.
*   **Espacio / W / Arriba:** Saltar.
*   **TAB:** Intercambiar personaje (Sol <-> Luna).
*   **ESC:** Volver al menú principal / Salir.

## 📂 Estructura del Proyecto

El código está organizado priorizando la escalabilidad:
*   `/core`: Motores lógicos (StateManager).
*   `/states`: Pantallas individuales (Menu, Play, Intro).
*   `/entities`: Clases de personajes y sus físicas (Sol, Luna).
*   `/libs`: Dependencias externas (bump).
*   `/assets`: (Pendiente) Sprites, mapas exportados de Tiled y audio.

## 📝 Próximos Pasos (Roadmap)
- [x] Arquitectura de Estados (State Machine).
- [x] Físicas asimétricas base (Gravedad independiente).
- [ ] Cámara dinámica (Follow/Clamp).
- [ ] Integración de STI (Simple Tiled Implementation) para el Nivel 1.
- [ ] Arte y pulido visual.

---
*Desarrollado por Eugenia Ramirez 🐾.*