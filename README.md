# RestServiceCreation

Este repositorio contiene una plantilla para generar servicios REST orientados a IBM DataPower.

## Estructura del proyecto

```
RestServiceCreation/
├── src/
│   └── scripts/
│       └── create-service.ps1    ← script principal
├── ServiceTemplate/
│   └── ServiceTemplate.xml       ← plantilla base del servicio
└── Services/                     ← servicios generados (se crea automáticamente)
    └── <ServiceName>/
        ├── ServiceTemplate.xml
        └── service-definition.json
```

## Comando para crear un servicio

Ejecuta desde la raíz del repositorio:

```powershell
.\src\scripts\create-service.ps1 -ServiceName MiServicio -StoredProcedure SP_TEMPLATE
```

Para sobrescribir un servicio existente:

```powershell
.\src\scripts\create-service.ps1 -ServiceName MiServicio -StoredProcedure SP_TEMPLATE -Force
```

## Qué hace el script

1. Copia `ServiceTemplate/` en `Services\<ServiceName>`.
2. Reemplaza el marcador `{{StoredProcedure}}` en todos los archivos de texto.
3. Genera `service-definition.json` con los valores utilizados.
