# Copilot Instructions

## Propósito del proyecto
Este repositorio genera servicios REST para IBM DataPower a partir de una plantilla. El script principal es `src/scripts/create-service.ps1`, que copia `ServiceTemplate/` en `Services/<ServiceName>/` y reemplaza marcadores de plantilla.

## Estructura de carpetas
```
RestServiceCreation/              ← raíz del repositorio
├── src/
│   └── scripts/
│       └── create-service.ps1   ← script principal de creación
├── ServiceTemplate/
│   └── ServiceTemplate.xml      ← plantilla base del servicio
└── Services/                    ← servicios generados (se crea automáticamente)
    └── <ServiceName>/
        ├── ServiceTemplate.xml      ← copia con marcadores reemplazados
        └── service-definition.json  ← registro de parámetros usados
```

- Todos los scripts nuevos van en `src/scripts/`.
- Los servicios generados siempre quedan en `Services/<ServiceName>/`.
- Nunca sugerir rutas fuera de esta estructura.

## Marcadores de plantilla
El único marcador activo en `ServiceTemplate.xml` es:

| Marcador | Parámetro del script | Descripción |
|---|---|---|
| `{{StoredProcedure}}` | `-StoredProcedure` | Nombre del stored procedure SQL |

- El reemplazo aplica a archivos con extensión: `.xml`, `.json`, `.txt`, `.ps1`, `.config`, `.md`.
- Para agregar un nuevo marcador: añadirlo en `ServiceTemplate.xml` con la sintaxis `{{NuevoMarcador}}` y registrarlo en el hashtable `$placeholders` dentro de `create-service.ps1`.

## Cómo agregar o modificar el script
- El hashtable `$placeholders` en `create-service.ps1` es donde se registran todos los marcadores:
  ```powershell
  $placeholders = @{
      '{{StoredProcedure}}' = $StoredProcedure
      # agregar nuevos marcadores aquí
  }
  ```
- Cada nuevo marcador requiere también un nuevo parámetro `[Parameter]` al inicio del script.
- Usa PowerShell para todos los scripts en este proyecto.

## Cómo actuar
- Usa `ServiceTemplate.xml` y `create-service.ps1` como referencia de estilo al generar código.
- Si el usuario pide crear un servicio, genera el comando PowerShell con la ruta `.\src\scripts\create-service.ps1`.
- No incluyas código completo de servicios dentro de este archivo; genera archivos separados.
