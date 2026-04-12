# RestServiceCreation

Este repositorio contiene una plantilla para generar servicios REST orientados a IBM DataPower.

## Uso principal

1. Copia la carpeta `ServiceTemplate` a una nueva ruta de servicio.
2. Reemplaza variables de entrada dentro de los archivos de plantilla.
3. Genera un archivo `service-definition.json` con los parámetros usados.

## Comando para crear un servicio

Ejecuta desde la raíz del repositorio:

```powershell
.\create-service.ps1 -ServiceName MyService -Environment DEV -StoredProcedure SP_TEMPLATE
```

Si quieres sobrescribir un servicio existente:

```powershell
.\create-service.ps1 -ServiceName MyService -Environment DEV -StoredProcedure SP_TEMPLATE -Force
```

## Qué hace el script

- Copia la carpeta `ServiceTemplate` en `Services\<ServiceName>`.
- Usa el archivo de plantilla `ServiceTemplate\ServiceTemplate.xml`.
- Reemplaza el marcador de plantilla:
  - `{{StoredProcedure}}`
- Crea `service-definition.json` con los valores utilizados.

## Opciones de ejecución

- Ejecución manual: usa PowerShell como se muestra arriba.
- Ejecución automática con IA: si usas Copilot/ChatGPT en VS Code, puedes pedir que se ejecute el comando mostrado.
