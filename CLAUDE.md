# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Propósito

Este repositorio genera la estructura de servicios REST para IBM DataPower. El artefacto principal es el script PowerShell (`create-service.ps1`) que copia `ServiceTemplate/` en un nuevo directorio `Services/<ServiceName>/` y reemplaza los marcadores de plantilla.

## Crear un servicio

Ejecutar desde la raíz del repositorio (requiere PowerShell):

```powershell
.\create-service.ps1 -ServiceName MiServicio -Environment DEV -StoredProcedure SP_MI_PROC
```

Para sobrescribir un servicio existente:

```powershell
.\create-service.ps1 -ServiceName MiServicio -Environment DEV -StoredProcedure SP_MI_PROC -Force
```

Valores válidos para `-Environment`: `DEV`, `FQ0Q1`, `PROD`.

## Qué hace el script

1. Copia `ServiceTemplate/` → `Services/<ServiceName>/`
2. Reemplaza `{{StoredProcedure}}` en todos los archivos `.xml`, `.json`, `.txt`, `.ps1`, `.config`, `.md`
3. Genera `Services/<ServiceName>/service-definition.json` con los parámetros utilizados

## Estructura de la plantilla

`ServiceTemplate/ServiceTemplate.xml` define la configuración del servicio DataPower. Contiene secciones por entorno (`DEV`, `FQ0Q1`) con mapeos de país/esquema, y usa `{{StoredProcedure}}` como único marcador actual.

Para agregar un nuevo marcador, añadirlo tanto en `ServiceTemplate.xml` como en el hashtable `$placeholders` dentro de `create-service.ps1`.

## Agregar un nuevo entorno

Agregar una nueva entrada al `ValidateSet` del parámetro `-Environment` en `create-service.ps1` y un bloque XML correspondiente en `ServiceTemplate/ServiceTemplate.xml`.
