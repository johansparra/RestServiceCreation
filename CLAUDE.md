# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Propósito

Este repositorio genera la estructura de servicios REST para IBM DataPower. El script principal es `src/scripts/create-service.ps1`, que copia `ServiceTemplate/` en `Services/<ServiceName>/` y reemplaza los marcadores de plantilla.

## Crear un servicio

Ejecutar desde la raíz del repositorio (requiere PowerShell):

```powershell
.\src\scripts\create-service.ps1 -ServiceName MiServicio -StoredProcedure SP_MI_PROC
```

Para sobrescribir un servicio existente:

```powershell
.\src\scripts\create-service.ps1 -ServiceName MiServicio -StoredProcedure SP_MI_PROC -Force
```

## Qué hace el script

1. Copia `ServiceTemplate/` → `Services/<ServiceName>/`
2. Reemplaza `{{StoredProcedure}}` en todos los archivos `.xml`, `.json`, `.txt`, `.ps1`, `.config`, `.md`
3. Genera `Services/<ServiceName>/service-definition.json` con los parámetros utilizados

## Estructura de la plantilla

`ServiceTemplate/ServiceTemplate.xml` define la configuración del servicio DataPower con secciones por entorno (`DEV`, `FQ0Q1`) y mapeos de país/esquema. Usa `{{StoredProcedure}}` como único marcador.

Para agregar un nuevo marcador: añadirlo en `ServiceTemplate.xml` con la sintaxis `{{NuevoMarcador}}` y registrarlo en el hashtable `$placeholders` dentro de `src/scripts/create-service.ps1`.
