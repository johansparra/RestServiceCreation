# Creación de servicio DataPower

Este archivo describe los pasos para crear un servicio usando el script `create-service.ps1`.

## 1. Preparar el proyecto

1. Abre PowerShell en la raíz del proyecto:
   - `d:\Claude\Copilot\RestServiceCreation`
2. Asegúrate de que existe la carpeta `ServiceTemplate` y el script `create-service.ps1`.
3. El archivo de plantilla es:
   - `ServiceTemplate\ServiceTemplate.xml`

## 2. Comando para crear el servicio

Usa este comando:

```powershell
.\create-service.ps1 -ServiceName MiServicio -Environment DEV -StoredProcedure SP_TEMPLATE
```

Si quieres sobrescribir un servicio existente:

```powershell
.\create-service.ps1 -ServiceName MiServicio -Environment DEV -StoredProcedure SP_TEMPLATE -Force
```

## 3. Ejecución manual (sin IA)

1. Abre PowerShell en la raíz del proyecto.
2. Copia y pega el comando anterior.
3. Presiona Enter.

Resultado:
- Se crea la carpeta `Services\MiServicio`.
- Se copia la plantilla de `ServiceTemplate`.
- Se reemplaza `{{StoredProcedure}}` dentro del archivo XML.
- Se crea `service-definition.json` con los parámetros usados.

## 4. Ejecución con IA

Si quieres que la IA ejecute el comando por ti:

1. Pide a la IA lo siguiente:
   - "Crea el servicio `MiServicio` en `DEV` con `SP_TEMPLATE` y ejecútalo." 
2. La IA usaría internamente el mismo comando:

```powershell
.\create-service.ps1 -ServiceName MiServicio -Environment DEV -StoredProcedure SP_TEMPLATE
```

### Nota importante

- No existe un comando diferente para la IA.
- El script es el mismo.
- La diferencia es que la IA puede ejecutar el comando por ti si está autorizada a usar el terminal.

## 5. Qué se debe pasar en el plan

Para que yo pueda ejecutar el servicio desde un plan, pásame al menos estos valores:

- `ServiceName`: nombre del servicio nuevo.
- `Environment`: por ejemplo `DEV` o `FQ0Q1`.
- `StoredProcedure`: nombre del procedimiento almacenado.

Ejemplo de plan:

> Crea el servicio `MiServicio` con entorno `DEV` y stored procedure `SP_TEMPLATE`. Ejecuta el script en la carpeta del proyecto.

## 6. Resumen

| Opción | Qué hace | Comando |
|--------|----------|---------|
| Manual | Tú ejecutas el script en PowerShell | `.\create-service.ps1 -ServiceName MiServicio -Environment DEV -StoredProcedure SP_TEMPLATE` |
| IA | La IA ejecuta el mismo script por ti si puede usar terminal | `.\create-service.ps1 -ServiceName MiServicio -Environment DEV -StoredProcedure SP_TEMPLATE` |
