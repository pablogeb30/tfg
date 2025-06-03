---
date: 14-11-2024
tags:
  - uni
  - tfg
  - planificacion
state: true
---
# Control de cambios

El control de cambios es fundamental para mantener un desarrollo organizado y trazable, permitiendo gestionar las distintas versiones del código a medida que avanza el proyecto. Para este TFG, se usará el sistema de control de versiones **Git** junto con la metodología **Git Flow**, un modelo de ramificación que facilita el control de las distintas fases de desarrollo y lanzamiento. A continuación, se detallan los elementos clave del flujo de trabajo y la convenciones de commits.

## Uso de Git Flow

**Git Flow** es un modelo de _branching_ que organiza el flujo de desarrollo en distintas ramas para separar y gestionar mejor las fases de desarrollo. En este proyecto se utilizarán las siguientes ramas principales:

- **main**: esta rama contiene las versiones estables del proyecto y solo se actualiza al finalizar una fase importante, como una entrega o una versión final.

- **develop**: es la rama de desarrollo, donde se integran los cambios antes de consolidarse en la rama _main_. En esta rama, se añade el código que está listo para probarse o que ha sido validado.

- **feature**: para cada nueva funcionalidad o módulo (como un nuevo sistema de combate o una nueva interfaz), se crea una rama de tipo `feature/nombre-de-la-funcionalidad`. Estas ramas permiten desarrollar nuevas características de forma aislada antes de integrarlas en _develop_.

- **release**: cuando se alcanza un hito en el proyecto y se está listo para lanzar una versión, se crea una rama _release_ desde _develop_. En esta rama se realizan las correcciones finales y ajustes antes de su integración en _main_.

- **hotfix**: si se encuentran errores importantes en main, se crea una rama _hotfix_ para solucionarlos rápidamente. Los cambios de estas ramas se integran en _main_ y _develop_.

Con este flujo, se garantiza un desarrollo organizado y escalable, permitiendo trabajar de forma modular y estructurada, además de mantener un historial de versiones claro. Para más información sobre GitFlow revisa este [enlace](https://www.atlassian.com/es/git/tutorials/comparing-workflows/gitflow-workflow).

## Formato de los commits

Para mantener un historial claro y coherente con **Git Flow**, se definirá un formato de commits que permita entender rápidamente qué cambios se han realizado en cada etapa del desarrollo. El formato será el siguiente:

```
[tipo]: descripción breve
```

1. **Tipos de commit**:
   - `feat`: para nuevas funcionalidades o módulos.
   - `fix`: para corrección de errores.
   - `docs`: para cambios en la documentación.
   - `style`: para cambios en el formato o estilo del código (sin afectar la funcionalidad).
   - `refactor`: para cambios en la estructura interna del código sin cambiar su comportamiento externo.
   - `test`: para añadir o modificar pruebas.
   - `config`: tareas menores, como cambios en archivos de configuración o actualización de dependencias.

2. **Descripción del commit**:
   - Debe ser breve pero descriptiva (máximo 50 caracteres), por ejemplo: `feat: añadir ataques mágicos` o `fix: ajustar daño enemigo`.

Al seguir esta estructura, se logra un historial de cambios claro y fácil de revisar, lo que facilita tanto el seguimiento del progreso como el proceso de revisión y auditoría del proyecto.

## Estrategia de versionado

Explicar la estrategia de **versionado** puede ayudar a dar contexto a cómo se identifican los distintos avances del proyecto. Una práctica común es el versionado semántico, usando números en el formato `MAJOR.MINOR.PATCH`:

- **MAJOR**: Cambios importantes que rompen la compatibilidad con versiones anteriores (por ejemplo, una gran reestructuración del sistema de combate o la adición de un módulo completamente nuevo).

- **MINOR**: Nuevas características que no rompen la compatibilidad (como añadir habilidades o mejorar la interfaz).

- **PATCH**: Correcciones de errores o pequeñas mejoras que no afectan el funcionamiento general.

Ejemplo: La primera versión estable del proyecto podría etiquetarse como `1.0.0`, mientras que mejoras menores y correcciones se numeran sucesivamente (`1.1.0`, `1.1.1`, etc.).

Esta estrategia de versionado se aplicará al final de cada sprint sobre el prototipo del videojuego. De esta forma se documenta de forma gradual el progreso del prototipo siguiendo una convención en las versiones.

## Configuración del repositorio

En este apartado, se detallan las herramientas que estás usando para gestionar el repositorio y cómo están configuradas:

1. **Repositorio remoto (GitHub)**: El proyecto esta alojado en GitHub, que sirve como copia del TFG en remoto. Este repositorio es público, por lo que cualquiera puede acceder para ver el trabajo realizado. Además se actualiza con cada operación push ejecutada, manteniéndose actualizado.
2. **Interfaz gráfica (GitKraken)**: Para realizar la gestión de los cambios desde mi ordenador se utiliza la herramienta **GitKraken**. Esta cuenta con una interfaz gráfica cómoda y útil que agiliza el uso de Git en mi flujo de trabajo.
3. **Respaldo en local**: Se mantiene una copia del repositorio en mi ordenador personal de forma local como respaldo del proyecto.
4. **Backup en NAS**: Como medida adicional, se realizan copias de seguridad diarias de mi ordenador personal y se almacenan en un NAS instalado en mi domicilio. Es un recurso útil caso de necesitar recuperar información local perdida.
