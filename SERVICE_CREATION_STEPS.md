# Pasos para crear un servicio DataPower

## 1. Preparar el entorno

Abre PowerShell en la raíz del repositorio (donde está la carpeta `src/` y `ServiceTemplate/`).

Verifica que existan:
- `ServiceTemplate\ServiceTemplate.xml`
- `src\scripts\create-service.ps1`

## 2. Ejecutar el script

```powershell
.\src\scripts\create-service.ps1 -ServiceName MiServicio -StoredProcedure SP_TEMPLATE
```

Para sobrescribir un servicio existente:

```powershell
.\src\scripts\create-service.ps1 -ServiceName MiServicio -StoredProcedure SP_TEMPLATE -Force
```

## 3. Resultado esperado

| Archivo generado | Descripción |
|---|---|
| `Services\MiServicio\ServiceTemplate.xml` | Plantilla con `{{StoredProcedure}}` reemplazado |
| `Services\MiServicio\service-definition.json` | Registro con los parámetros usados |

## 4. Parámetros del script

| Parámetro | Obligatorio | Descripción |
|---|---|---|
| `-ServiceName` | Sí | Nombre del servicio a crear |
| `-StoredProcedure` | No (default: `SP_TEMPLATE`) | Nombre del stored procedure SQL |
| `-Force` | No | Sobrescribe el servicio si ya existe |
| `-TemplatePath` | No (default: `.\ServiceTemplate`) | Ruta a la plantilla fuente |
| `-DestinationRoot` | No (default: `.\Services`) | Carpeta destino de los servicios |
