<#
.SYNOPSIS
Copia una plantilla de servicio DataPower y reemplaza variables dentro de los archivos.

.DESCRIPTION
Este script duplica la carpeta ServiceTemplate en una nueva carpeta de servicio.
También reemplaza valores de plantilla en archivos de texto con variables de entrada.
#>

[CmdletBinding()]
# [CmdletBinding()] habilita características avanzadas de script como soporte de parámetros, help y manejo unificado de errores.
param(
    [Parameter(Mandatory=$false)]
    [string]$TemplatePath = ".\ServiceTemplate",

    [Parameter(Mandatory=$false)]
    [string]$DestinationRoot = ".\Services",

    [Parameter(Mandatory=$true)]
    [string]$ServiceName,

    [Parameter(Mandatory=$false)]
    [ValidateSet('DEV','FQ0Q1','PROD')]
    [string]$Environment = 'DEV',

    [Parameter(Mandatory=$false)]
    [string]$StoredProcedure = 'SP_TEMPLATE',

    [Parameter(Mandatory=$false)]
    [switch]$Force
)

function Write-Status {
    param([string]$Message)
    Write-Host "[create-service] $Message"
}

$ErrorActionPreference = 'Stop'

$TemplatePath = Resolve-Path -Path $TemplatePath -ErrorAction Stop
$DestinationRoot = Resolve-Path -Path $DestinationRoot -ErrorAction SilentlyContinue
if (-not $DestinationRoot) {
    $DestinationRoot = Join-Path -Path (Get-Location) -ChildPath '.\Services'
    New-Item -Path $DestinationRoot -ItemType Directory -Force | Out-Null
}

$DestinationPath = Join-Path -Path $DestinationRoot -ChildPath $ServiceName

if (Test-Path $DestinationPath) {
    if ($Force) {
        Write-Status "La ruta ya existía. Eliminando contenido existente: $DestinationPath"
        Remove-Item -Path $DestinationPath -Recurse -Force
    } else {
        Throw "La ruta ya existe: $DestinationPath. Usa -Force para sobrescribir."
    }
}

Write-Status "Copiando plantilla desde '$TemplatePath' a '$DestinationPath'..."
Copy-Item -Path $TemplatePath -Destination $DestinationPath -Recurse -Force

$placeholders = @{
    '{{StoredProcedure}}' = $StoredProcedure
}

Write-Status "Reemplazando variables dentro de los archivos..."
Get-ChildItem -Path $DestinationPath -Recurse -File | Where-Object {
    @('.xml', '.json', '.txt', '.ps1', '.config', '.md') -contains $_.Extension.ToLower()
} | ForEach-Object {
    $content = Get-Content -Path $_.FullName -Raw -ErrorAction Stop
    foreach ($key in $placeholders.Keys) {
        $value = $placeholders[$key]
        $content = $content -replace [regex]::Escape($key), [regex]::Escape($value)
    }
    Set-Content -Path $_.FullName -Value $content -Encoding UTF8
}

$definition = [ordered]@{
    ServiceName      = $ServiceName
    Environment      = $Environment
    StoredProcedure  = $StoredProcedure
    CreatedAt        = (Get-Date).ToString('u')
    SourceTemplate   = $TemplatePath.Path
}

$definitionPath = Join-Path -Path $DestinationPath -ChildPath 'service-definition.json'
$definition | ConvertTo-Json -Depth 5 | Set-Content -Path $definitionPath -Encoding UTF8

Write-Status "Servicio creado correctamente en: $DestinationPath"
Write-Status "Archivo de definición guardado en: $definitionPath"

Write-Output $DestinationPath
