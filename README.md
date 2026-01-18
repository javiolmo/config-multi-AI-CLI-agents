# 🤖 Multi-Agent Unified Workspace

Este repositorio está configurado bajo el estándar de **Vibe Coding** y **Agentic Workflows**, permitiendo que múltiples asistentes de IA (**Claude Code**, **Gemini CLI** y **OpenCode**) trabajen de forma armónica sobre una única fuente de verdad.

## 🎯 El Concepto: "Single Source of Truth"

En lugar de fragmentar las instrucciones en múltiples archivos de configuración, este entorno centraliza la lógica en `AGENTS.md`. Gracias a un mapeo de configuraciones y enlaces simbólicos, garantizamos que:

- **Claude CLI** lea las reglas desde `CLAUDE.md` (enlazado a `AGENTS.md`).
    
- **Gemini CLI** busque el contexto en `AGENTS.md` mediante su `settings.json`.
    
- **OpenCode** utilice el estándar nativo `AGENTS.md`.
    

## 🏗️ Estructura del Ecosistema

|**Archivo / Directorio**|**Función**|**Agente Destino**|
|---|---|---|
|`AGENTS.md`|Instrucciones, reglas de estilo y contexto del proyecto.|**Todos**|
|`.gemini/settings.json`|Configuración de comportamiento y herramientas de Google.|Gemini CLI|
|`.mcp.json`|Definición de servidores de contexto (Model Context Protocol).|Claude / Gemini|
|`opencode.json`|Preferencias de automatización y herramientas No-Code.|OpenCode|
|`CLAUDE.md`|Enlace simbólico (Symlink) para compatibilidad.|Claude Code|

---

## 🚀 Flujo de Trabajo (Vibe Coding)

1. **Define la "Vibración":** Escribe en `AGENTS.md` cómo quieres que se comporte el código (ej: "Prioriza legibilidad sobre brevedad").
    
2. **Ejecuta el Agente:** Usa `claude`, `gemini` u `opencode` en la terminal según la tarea (Claude es excelente para refactorizar, Gemini para investigación con Google Search).
    
3. **Contexto Sincronizado:** Cualquier cambio en las reglas dentro de `AGENTS.md` es absorbido instantáneamente por todos los agentes.
    

---

## 🛠️ Instalación y Setup

Para configurar este entorno automáticamente (creación de directorios, symlinks de compatibilidad y archivos base), hemos preparado un script de automatización.

### Requisitos previos

- Tener instaladas las CLIs oficiales de [Claude Code](https://anthropic.com/), [Gemini CLI](https://ai.google.dev/) y el entorno de [OpenCode](https://www.google.com/search?q=https://opencode.dev).
    
- Entorno Unix (Linux/macOS) o WSL2 en Windows.
    

### Paso a paso

1. Clona este repositorio o inicia tu proyecto.
    
2. Dale permisos de ejecución al script de setup:
    
    Bash
    
    ```
    chmod +x setup-agents.sh
    ```
    
3. Ejecuta el script:
    
    Bash
    
    ```
    ./setup-agents.sh
    ```
    

> [!TIP]
> 
> Una vez finalizado el setup, puedes probar la conexión ejecutando claude "revisa el archivo AGENTS.md y dime si entiendes las reglas".

---
## 🧩 Extensibilidad (MCP)
¿Quieres añadir más herramientas como Google Search, GitHub o acceso a bases de datos? 
Consulta la [Guía de Configuración MCP](MCP_GUIDE.md) para aprender cómo extender las capacidades de tus agentes de forma manual.

---

**Versión**: 1.0
**Última actualización**: 2026-01-18
**Autor**: AI Systems Engineering (#AI Team) by Javi Olmo