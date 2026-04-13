# Guía de preparación para trabajar con Claude Code y GitHub Copilot

Este documento explica qué archivos y carpetas necesita un repositorio para trabajar correctamente con Claude Code y GitHub Copilot. Es independiente de cualquier proyecto específico.

---

## 1. Estructura mínima recomendada

```
mi-proyecto/
├── .github/
│   └── copilot-instructions.md   ← instrucciones para GitHub Copilot
├── CLAUDE.md                     ← instrucciones para Claude Code
└── README.md                     ← descripción general del proyecto
```

Con solo estos tres archivos, ambas IAs tienen contexto suficiente para empezar a ayudarte.

---

## 2. Archivos y su propósito

### `.github/copilot-instructions.md`
Le dice a GitHub Copilot cómo comportarse dentro del repositorio.

**Qué incluir:**
- Propósito del proyecto (una o dos líneas)
- Estructura de carpetas con descripción de cada parte
- Convenciones del código (lenguaje, estilo, herramientas)
- Ejemplos de peticiones en lenguaje natural y el código que Copilot debe generar
- Reglas específicas: qué hacer, qué evitar

**Cuándo lo lee Copilot:** automáticamente cada vez que abres el repositorio en VS Code con la extensión de GitHub Copilot instalada.

---

### `CLAUDE.md`
Le dice a Claude Code cómo comportarse dentro del repositorio.

**Qué incluir:**
- Propósito del proyecto
- Comandos principales para ejecutar, construir o probar el proyecto
- Estructura relevante de carpetas
- Convenciones o restricciones importantes

**Cuándo lo lee Claude:** automáticamente al iniciar una sesión en el directorio del proyecto.

---

### `README.md`
Documentación general del proyecto. La leen tanto las IAs como los humanos.

**Qué incluir:**
- Descripción del proyecto
- Requisitos previos
- Comandos de uso
- Estructura del proyecto

---

## 3. Preparación

1. Crear el repositorio en GitHub.
2. Clonar en local y abrir en VS Code.
3. Crear la carpeta `.github/` en la raíz.
4. Crear los tres archivos: `CLAUDE.md`, `.github/copilot-instructions.md`, `README.md`.
5. Llenar cada archivo con el contexto del proyecto (ver sección 2).
6. Hacer commit y push.

**Extensiones necesarias en VS Code:**
- GitHub Copilot
- Claude Code (si se usa como extensión)

---

## 4. Ejecución

### Con GitHub Copilot
- Abre el chat de Copilot (`Ctrl+Alt+I`) y escribe tu petición en lenguaje natural.
- Copilot leerá `copilot-instructions.md` para entender el contexto antes de responder.
- También sugiere código en el editor mientras escribes (autocompletado).

### Con Claude Code
- Abre la terminal en la raíz del proyecto.
- Ejecuta `claude` para iniciar una sesión.
- Claude leerá `CLAUDE.md` automáticamente y tendrá contexto del proyecto desde el inicio.

---

## 5. Resultado esperado

Cuando los archivos están bien configurados:

| Situación | Qué ocurre |
|---|---|
| Pides crear un archivo o script | La IA genera código coherente con el estilo del proyecto |
| Pides ejecutar un comando | La IA usa los comandos documentados en `README.md` o `CLAUDE.md` |
| Pides agregar una funcionalidad | La IA respeta la estructura de carpetas definida |
| La IA sugiere algo incorrecto | Ajusta `copilot-instructions.md` o `CLAUDE.md` con más contexto |

---

## 6. Consejos

- **Sé específico en las instrucciones:** cuanto más detalle tengan `CLAUDE.md` y `copilot-instructions.md`, menos correcciones necesitarás hacer.
- **Incluye ejemplos reales:** un ejemplo de petición + respuesta esperada vale más que un párrafo de explicación.
- **Mantén los archivos actualizados:** si cambias la estructura del proyecto, actualiza también estos archivos.
- **No pongas código completo** dentro de las instrucciones; referencia los archivos del proyecto en su lugar.
