# Manual Técnico (Integración de Pre-commit)

Este documento describe cómo configurar y utilizar los ganchos de pre-commit en este proyecto.

## Requisitos previos

1. **Python 3.8 o superior** con la herramienta `pip` disponible.
2. **Git** para el control de versiones.

## Instalación de pre-commit

1. Instale la herramienta `pre-commit`:
   ```bash
   pip install pre-commit
   ```
2. Desde la raíz del repositorio, ejecute:
   ```bash
   pre-commit install
   ```
   Esto configurará los ganchos para que se ejecuten automáticamente al realizar un `git commit`.

## Uso manual

Si desea ejecutar los ganchos de forma manual sobre todo el código:
```bash
pre-commit run --all-files
```

## Hooks configurados

El archivo `.pre-commit-config.yaml` incluye los siguientes hooks del repositorio [pre-commit-hooks](https://github.com/pre-commit/pre-commit-hooks):

- **end-of-file-fixer**: Garantiza que todos los archivos terminen con una línea en blanco.
- **trailing-whitespace**: Elimina los espacios en blanco al final de cada línea.
- **check-added-large-files**: Detecta archivos añadidos que superen un tamaño razonable.
- **check-merge-conflict**: Impide que se suban archivos con marcadores de conflicto de Git.
